//
//  UIScrollView+XYEmptyDataSet.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIScrollView+XYEmptyDataSet.h"
#import <objc/runtime.h>
#import "UIView+frame.h"
#import "UIView+XYCornerBorder.h"
#import "XYMacroConfig.h"

@interface UIView (ConstraintBasedLayoutExtensions)

- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute;

@end

@interface WeakObjectContainer : NSObject

@property (nonatomic, readonly, weak) id weakObject;

- (instancetype)initWithWeakObject:(id)object;

@end

@interface EmptyDataSetView : UIView

@property (nonatomic, readonly) UIView *contentView;
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *detailLabel;
@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@property (nonatomic, assign) CGFloat verticalOffset;
@property (nonatomic, assign) CGFloat verticalSpace;

@property (nonatomic, assign) BOOL fadeInOnDisplay;

- (void)setupConstraints;
- (void)prepareForReuse;

@end


#pragma mark - UIScrollView+EmptyDataSet

static char const * const kEmptyDataSetSource =     "emptyDataSetSource";
static char const * const kEmptyDataSetDelegate =   "emptyDataSetDelegate";
static char const * const kEmptyDataSetView =       "emptyDataSetView";

#define kEmptyImageViewAnimationKey @"com..emptyDataSet.imageViewAnimation"

@interface UIScrollView () <UIGestureRecognizerDelegate>
@property (nonatomic, readonly) EmptyDataSetView *emptyDataSetView;
@end


@implementation UIScrollView (XYEmptyDataSet)
#pragma mark - Getters (Public)

- (id<EmptyDataSetSource>)emptyDataSetSource
{
    WeakObjectContainer *container = objc_getAssociatedObject(self, kEmptyDataSetSource);
    return container.weakObject;
}

- (id<EmptyDataSetDelegate>)emptyDataSetDelegate
{
    WeakObjectContainer *container = objc_getAssociatedObject(self, kEmptyDataSetDelegate);
    return container.weakObject;
}

- (BOOL)isEmptyDataSetVisible
{
    UIView *view = objc_getAssociatedObject(self, kEmptyDataSetView);
    return view ? !view.hidden : NO;
}


#pragma mark - Getters (Private)

- (EmptyDataSetView *)emptyDataSetView
{
    EmptyDataSetView *view = objc_getAssociatedObject(self, kEmptyDataSetView);
    
    if (!view)
    {
        view = [EmptyDataSetView new];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        view.hidden = YES;
        
        view.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_didTapContentView:)];
        view.tapGesture.delegate = self;
        [view addGestureRecognizer:view.tapGesture];
        
        [self setEmptyDataSetView:view];
    }
    return view;
}

- (BOOL)_canDisplay
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource conformsToProtocol:@protocol(EmptyDataSetSource)]) {
        if ([self isKindOfClass:[UITableView class]] || [self isKindOfClass:[UICollectionView class]] || [self isKindOfClass:[UIScrollView class]]) {
            return YES;
        }
    }
    
    return NO;
}

- (NSInteger)_itemsCount
{
    NSInteger items = 0;
    
    // UIScollView doesn't respond to 'dataSource' so let's exit
    if (![self respondsToSelector:@selector(dataSource)]) {
        return items;
    }
    
    // UITableView support
    if ([self isKindOfClass:[UITableView class]]) {
        
        UITableView *tableView = (UITableView *)self;
        id <UITableViewDataSource> dataSource = tableView.dataSource;
        
        NSInteger sections = 1;
        
        if (dataSource && [dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
            sections = [dataSource numberOfSectionsInTableView:tableView];
        }
        
        if (dataSource && [dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
            for (NSInteger section = 0; section < sections; section++) {
                items += [dataSource tableView:tableView numberOfRowsInSection:section];
            }
        }
    }
    // UICollectionView support
    else if ([self isKindOfClass:[UICollectionView class]]) {
        
        UICollectionView *collectionView = (UICollectionView *)self;
        id <UICollectionViewDataSource> dataSource = collectionView.dataSource;
        
        NSInteger sections = 1;
        
        if (dataSource && [dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
            sections = [dataSource numberOfSectionsInCollectionView:collectionView];
        }
        
        if (dataSource && [dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
            for (NSInteger section = 0; section < sections; section++) {
                items += [dataSource collectionView:collectionView numberOfItemsInSection:section];
            }
        }
    }
    
    return items;
}


#pragma mark - Data Source Getters

- (NSAttributedString *)_titleLabelString
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(titleForEmptyDataSet:)]) {
        NSAttributedString *string = [self.emptyDataSetSource titleForEmptyDataSet:self];
        if (string) NSAssert([string isKindOfClass:[NSAttributedString class]], @"You must return a valid NSAttributedString object for -titleForEmptyDataSet:");
        return string;
    }
    return nil;
}

- (NSAttributedString *)_detailLabelString
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(descriptionForEmptyDataSet:)]) {
        NSAttributedString *string = [self.emptyDataSetSource descriptionForEmptyDataSet:self];
        if (string) NSAssert([string isKindOfClass:[NSAttributedString class]], @"You must return a valid NSAttributedString object for -descriptionForEmptyDataSet:");
        return string;
    }
    return nil;
}

- (UIImage *)_image
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(imageForEmptyDataSet:)]) {
        UIImage *image = [self.emptyDataSetSource imageForEmptyDataSet:self];
        if (image) NSAssert([image isKindOfClass:[UIImage class]], @"You must return a valid UIImage object for -imageForEmptyDataSet:");
        return image;
    }
    return nil;
}

- (CAAnimation *)_imageAnimation
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(imageAnimationForEmptyDataSet:)]) {
        CAAnimation *imageAnimation = [self.emptyDataSetSource imageAnimationForEmptyDataSet:self];
        if (imageAnimation) NSAssert([imageAnimation isKindOfClass:[CAAnimation class]], @"You must return a valid CAAnimation object for -imageAnimationForEmptyDataSet:");
        return imageAnimation;
    }
    return nil;
}

- (UIColor *)_imageTintColor
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(imageTintColorForEmptyDataSet:)]) {
        UIColor *color = [self.emptyDataSetSource imageTintColorForEmptyDataSet:self];
        if (color) NSAssert([color isKindOfClass:[UIColor class]], @"You must return a valid UIColor object for -imageTintColorForEmptyDataSet:");
        return color;
    }
    return nil;
}

- (NSAttributedString *)_buttonTitleForState:(UIControlState)state
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(buttonTitleForEmptyDataSet:forState:)]) {
        NSAttributedString *string = [self.emptyDataSetSource buttonTitleForEmptyDataSet:self forState:state];
        if (string) NSAssert([string isKindOfClass:[NSAttributedString class]], @"You must return a valid NSAttributedString object for -buttonTitleForEmptyDataSet:forState:");
        return string;
    }
    return nil;
}

- (UIImage *)_buttonImageForState:(UIControlState)state
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(buttonImageForEmptyDataSet:forState:)]) {
        UIImage *image = [self.emptyDataSetSource buttonImageForEmptyDataSet:self forState:state];
        if (image) NSAssert([image isKindOfClass:[UIImage class]], @"You must return a valid UIImage object for -buttonImageForEmptyDataSet:forState:");
        return image;
    }
    return nil;
}

- (UIImage *)_buttonBackgroundImageForState:(UIControlState)state
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(buttonBackgroundImageForEmptyDataSet:forState:)]) {
        UIImage *image = [self.emptyDataSetSource buttonBackgroundImageForEmptyDataSet:self forState:state];
        if (image) NSAssert([image isKindOfClass:[UIImage class]], @"You must return a valid UIImage object for -buttonBackgroundImageForEmptyDataSet:forState:");
        return image;
    }
    return nil;
}

- (CGFloat)_buttonWidth{
    CGFloat offset = 0.0;
    
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(buttonWidthForEmptyDataSet:)]) {
        offset = [self.emptyDataSetSource buttonWidthForEmptyDataSet:self];
    }
    return offset;
}

- (UIColor *)_dataSetBackgroundColor
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(backgroundColorForEmptyDataSet:)]) {
        UIColor *color = [self.emptyDataSetSource backgroundColorForEmptyDataSet:self];
        if (color) NSAssert([color isKindOfClass:[UIColor class]], @"You must return a valid UIColor object for -backgroundColorForEmptyDataSet:");
        return color;
    }
    return [UIColor clearColor];
}

- (UIView *)_customView
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(customViewForEmptyDataSet:)]) {
        UIView *view = [self.emptyDataSetSource customViewForEmptyDataSet:self];
        if (view) NSAssert([view isKindOfClass:[UIView class]], @"You must return a valid UIView object for -customViewForEmptyDataSet:");
        return view;
    }
    return nil;
}

- (CGFloat)_verticalOffset
{
    CGFloat offset = 0.0;
    
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(verticalOffsetForEmptyDataSet:)]) {
        offset = [self.emptyDataSetSource verticalOffsetForEmptyDataSet:self];
    }
    return offset;
}

- (CGFloat)_verticalSpace
{
    if (self.emptyDataSetSource && [self.emptyDataSetSource respondsToSelector:@selector(spaceHeightForEmptyDataSet:)]) {
        return [self.emptyDataSetSource spaceHeightForEmptyDataSet:self];
    }
    return 0.0;
}


#pragma mark - Delegate Getters & Events (Private)

- (BOOL)_shouldFadeIn {
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetShouldFadeIn:)]) {
        return [self.emptyDataSetDelegate emptyDataSetShouldFadeIn:self];
    }
    return YES;
}

- (BOOL)_shouldDisplay
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetShouldDisplay:)]) {
        return [self.emptyDataSetDelegate emptyDataSetShouldDisplay:self];
    }
    return YES;
}

- (BOOL)_shouldBeForcedToDisplay
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetShouldBeForcedToDisplay:)]) {
        return [self.emptyDataSetDelegate emptyDataSetShouldBeForcedToDisplay:self];
    }
    return NO;
}

- (BOOL)_isTouchAllowed
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetShouldAllowTouch:)]) {
        return [self.emptyDataSetDelegate emptyDataSetShouldAllowTouch:self];
    }
    return YES;
}

- (BOOL)_isScrollAllowed
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetShouldAllowScroll:)]) {
        return [self.emptyDataSetDelegate emptyDataSetShouldAllowScroll:self];
    }
    return NO;
}

- (BOOL)_isImageViewAnimateAllowed
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetShouldAnimateImageView:)]) {
        return [self.emptyDataSetDelegate emptyDataSetShouldAnimateImageView:self];
    }
    return NO;
}

- (void)_willAppear
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetWillAppear:)]) {
        [self.emptyDataSetDelegate emptyDataSetWillAppear:self];
    }
}

- (void)_didAppear
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetDidAppear:)]) {
        [self.emptyDataSetDelegate emptyDataSetDidAppear:self];
    }
}

- (void)_willDisappear
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetWillDisappear:)]) {
        [self.emptyDataSetDelegate emptyDataSetWillDisappear:self];
    }
}

- (void)_didDisappear
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSetDidDisappear:)]) {
        [self.emptyDataSetDelegate emptyDataSetDidDisappear:self];
    }
}

- (void)_didTapContentView:(id)sender
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSet:didTapView:)]) {
        [self.emptyDataSetDelegate emptyDataSet:self didTapView:sender];
    }
}

- (void)_didTapDataButton:(id)sender
{
    if (self.emptyDataSetDelegate && [self.emptyDataSetDelegate respondsToSelector:@selector(emptyDataSet:didTapButton:)]) {
        [self.emptyDataSetDelegate emptyDataSet:self didTapButton:sender];
    }
}


#pragma mark - Setters (Public)

- (void)setEmptyDataSetSource:(id<EmptyDataSetSource>)datasource
{
    if (!datasource || ![self _canDisplay]) {
        [self _invalidate];
    }
    
    objc_setAssociatedObject(self, kEmptyDataSetSource, [[WeakObjectContainer alloc] initWithWeakObject:datasource], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // We add method sizzling for injecting -_reloadData implementation to the native -reloadData implementation
    [self swizzleIfPossible:@selector(reloadData)];
    
    // Exclusively for UITableView, we also inject -_reloadData to -endUpdates
    if ([self isKindOfClass:[UITableView class]]) {
        [self swizzleIfPossible:@selector(endUpdates)];
    }
}

- (void)setEmptyDataSetDelegate:(id<EmptyDataSetDelegate>)delegate
{
    if (!delegate) {
        [self _invalidate];
    }
    
    objc_setAssociatedObject(self, kEmptyDataSetDelegate, [[WeakObjectContainer alloc] initWithWeakObject:delegate], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - Setters (Private)

- (void)setEmptyDataSetView:(EmptyDataSetView *)view
{
    objc_setAssociatedObject(self, kEmptyDataSetView, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - Reload APIs (Public)

- (void)reloadEmptyDataSet
{
    [self _reloadEmptyDataSet];
}


#pragma mark - Reload APIs (Private)

- (void)_reloadEmptyDataSet
{
    if (![self _canDisplay]) {
        return;
    }
    
    if (([self _shouldDisplay] && [self _itemsCount] == 0) || [self _shouldBeForcedToDisplay])
    {
        // Notifies that the empty dataset view will appear
        [self _willAppear];
        
        EmptyDataSetView *view = self.emptyDataSetView;
        
        if (!view.superview) {
            // Send the view all the way to the back, in case a header and/or footer is present, as well as for sectionHeaders or any other content
            if (([self isKindOfClass:[UITableView class]] || [self isKindOfClass:[UICollectionView class]]) && self.subviews.count > 1) {
                [self insertSubview:view atIndex:0];
            }
            else {
                [self addSubview:view];
            }
        }
        
        // Removing view resetting the view and its constraints it very important to guarantee a good state
        [view prepareForReuse];
        
        UIView *customView = [self _customView];
        
        // If a non-nil custom view is available, let's configure it instead
        if (customView) {
            view.customView = customView;
        }
        else {
            // Get the data from the data source
            NSAttributedString *titleLabelString = [self _titleLabelString];
            NSAttributedString *detailLabelString = [self _detailLabelString];
            
            CGFloat buttonWidth = [self _buttonWidth];
            UIImage *buttonImage = [self _buttonImageForState:UIControlStateNormal];
            NSAttributedString *buttonTitle = [self _buttonTitleForState:UIControlStateNormal];
            
            UIImage *image = [self _image];
            UIColor *imageTintColor = [self _imageTintColor];
            UIImageRenderingMode renderingMode = imageTintColor ? UIImageRenderingModeAlwaysTemplate : UIImageRenderingModeAlwaysOriginal;
            
            view.verticalSpace = [self _verticalSpace];
            
            // Configure Image
            if (image) {
                if ([image respondsToSelector:@selector(imageWithRenderingMode:)] && image.CGImage) {
                    view.imageView.image = [image imageWithRenderingMode:renderingMode];
                    view.imageView.tintColor = imageTintColor;
                }
                else {
                    // iOS 6 fallback: insert code to convert imaged if needed
                    view.imageView.image = image;
                }
            }
            
            // Configure title label
            if (titleLabelString) {
                view.titleLabel.attributedText = titleLabelString;
            }
            
            // Configure detail label
            if (detailLabelString) {
                view.detailLabel.attributedText = detailLabelString;
            }
            
            // Configure button
            if (buttonImage) {
                [view.button setImage:buttonImage forState:UIControlStateNormal];
                [view.button setImage:[self _buttonImageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
            }
            else if (buttonTitle) {
                [view.button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
                [view.button setAttributedTitle:[self _buttonTitleForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
                [view.button setBackgroundImage:[self _buttonBackgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
                [view.button setBackgroundImage:[self _buttonBackgroundImageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
            }
            view.button.width = buttonWidth;
            [view.button addCorner];
        }
        
        // Configure offset
        view.verticalOffset = [self _verticalOffset];
        
        // Configure the empty dataset view
        view.backgroundColor = [self _dataSetBackgroundColor];
        view.hidden = NO;
        view.clipsToBounds = YES;
        
        // Configure empty dataset userInteraction permission
        view.userInteractionEnabled = [self _isTouchAllowed];
        
        // Configure empty dataset fade in display
        view.fadeInOnDisplay = [self _shouldFadeIn];
        
        [view setupConstraints];
        
        [UIView performWithoutAnimation:^{
            [view layoutIfNeeded];
        }];
        
        // Configure scroll permission
        self.scrollEnabled = [self _isScrollAllowed];
        
        // Configure image view animation
        if ([self _isImageViewAnimateAllowed])
        {
            CAAnimation *animation = [self _imageAnimation];
            
            if (animation) {
                [self.emptyDataSetView.imageView.layer addAnimation:animation forKey:kEmptyImageViewAnimationKey];
            }
        }
        else if ([self.emptyDataSetView.imageView.layer animationForKey:kEmptyImageViewAnimationKey]) {
            [self.emptyDataSetView.imageView.layer removeAnimationForKey:kEmptyImageViewAnimationKey];
        }
        
        // Notifies that the empty dataset view did appear
        [self _didAppear];
    }
    else if (self.isEmptyDataSetVisible) {
        [self _invalidate];
    }
}

- (void)_invalidate
{
    // Notifies that the empty dataset view will disappear
    [self _willDisappear];
    
    if (self.emptyDataSetView) {
        [self.emptyDataSetView prepareForReuse];
        [self.emptyDataSetView removeFromSuperview];
        
        [self setEmptyDataSetView:nil];
    }
    
    self.scrollEnabled = YES;
    
    // Notifies that the empty dataset view did disappear
    [self _didDisappear];
}


#pragma mark - Method Swizzling

static NSMutableDictionary *_impLookupTable;
static NSString *const SwizzleInfoPointerKey = @"pointer";
static NSString *const SwizzleInfoOwnerKey = @"owner";
static NSString *const SwizzleInfoSelectorKey = @"selector";

// Based on Bryce Buchanan's swizzling technique http://blog.newrelic.com/2014/04/16/right-way-to-swizzle/
// And Juzzin's ideas https://github.com/juzzin/JUSEmptyViewController

void _original_implementation(id self, SEL _cmd)
{
    // Fetch original implementation from lookup table
    Class baseClass = _baseClassToSwizzleForTarget(self);
    NSString *key = _implementationKey(baseClass, _cmd);
    
    NSDictionary *swizzleInfo = [_impLookupTable objectForKey:key];
    NSValue *impValue = [swizzleInfo valueForKey:SwizzleInfoPointerKey];
    
    IMP impPointer = [impValue pointerValue];
    
    // We then inject the additional implementation for reloading the empty dataset
    // Doing it before calling the original implementation does update the 'isEmptyDataSetVisible' flag on time.
    [self _reloadEmptyDataSet];
    
    // If found, call original implementation
    if (impPointer) {
        ((void(*)(id,SEL))impPointer)(self,_cmd);
    }
}

NSString *_implementationKey(Class class, SEL selector)
{
    if (!class || !selector) {
        return nil;
    }
    
    NSString *className = NSStringFromClass([class class]);
    
    NSString *selectorName = NSStringFromSelector(selector);
    return [NSString stringWithFormat:@"%@_%@",className,selectorName];
}

Class _baseClassToSwizzleForTarget(id target)
{
    if ([target isKindOfClass:[UITableView class]]) {
        return [UITableView class];
    }
    else if ([target isKindOfClass:[UICollectionView class]]) {
        return [UICollectionView class];
    }
    else if ([target isKindOfClass:[UIScrollView class]]) {
        return [UIScrollView class];
    }
    
    return nil;
}

- (void)swizzleIfPossible:(SEL)selector
{
    // Check if the target responds to selector
    if (![self respondsToSelector:selector]) {
        return;
    }
    
    // Create the lookup table
    if (!_impLookupTable) {
        _impLookupTable = [[NSMutableDictionary alloc] initWithCapacity:3]; // 3 represent the supported base classes
    }
    
    // We make sure that setImplementation is called once per class kind, UITableView or UICollectionView.
    for (NSDictionary *info in [_impLookupTable allValues]) {
        Class class = [info objectForKey:SwizzleInfoOwnerKey];
        NSString *selectorName = [info objectForKey:SwizzleInfoSelectorKey];
        
        if ([selectorName isEqualToString:NSStringFromSelector(selector)]) {
            if ([self isKindOfClass:class]) {
                return;
            }
        }
    }
    
    Class baseClass = _baseClassToSwizzleForTarget(self);
    NSString *key = _implementationKey(baseClass, selector);
    NSValue *impValue = [[_impLookupTable objectForKey:key] valueForKey:SwizzleInfoPointerKey];
    
    // If the implementation for this class already exist, skip!!
    if (impValue || !key || !baseClass) {
        return;
    }
    
    // Swizzle by injecting additional implementation
    Method method = class_getInstanceMethod(baseClass, selector);
    IMP _newImplementation = method_setImplementation(method, (IMP)_original_implementation);
    
    // Store the new implementation in the lookup table
    NSDictionary *swizzledInfo = @{SwizzleInfoOwnerKey: baseClass,
                                   SwizzleInfoSelectorKey: NSStringFromSelector(selector),
                                   SwizzleInfoPointerKey: [NSValue valueWithPointer:_newImplementation]};
    
    [_impLookupTable setObject:swizzledInfo forKey:key];
}


#pragma mark - UIGestureRecognizerDelegate Methods

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer.view isEqual:self.emptyDataSetView]) {
        return [self _isTouchAllowed];
    }
    
    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    UIGestureRecognizer *tapGesture = self.emptyDataSetView.tapGesture;
    
    if ([gestureRecognizer isEqual:tapGesture] || [otherGestureRecognizer isEqual:tapGesture]) {
        return YES;
    }
    
    // defer to emptyDataSetDelegate's implementation if available
    if ( (self.emptyDataSetDelegate != (id)self) && [self.emptyDataSetDelegate respondsToSelector:@selector(gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:)]) {
        return [(id)self.emptyDataSetDelegate gestureRecognizer:gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:otherGestureRecognizer];
    }
    
    return NO;
}

@end


#pragma mark - EmptyDataSetView

@interface EmptyDataSetView ()
@end

@implementation EmptyDataSetView
@synthesize contentView = _contentView;
@synthesize titleLabel = _titleLabel, detailLabel = _detailLabel, imageView = _imageView, button = _button;

#pragma mark - Initialization Methods

- (instancetype)init
{
    self =  [super init];
    if (self) {
        [self addSubview:self.contentView];
    }
    return self;
}

- (void)didMoveToSuperview
{
    CGRect superviewBounds = self.superview.bounds;
    self.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(superviewBounds), CGRectGetHeight(superviewBounds));
    
    WeakSelf
    void(^fadeInBlock)(void) = ^{weakSelf.contentView.alpha = 1.0;};
    
    if (self.fadeInOnDisplay) {
        [UIView animateWithDuration:0.25
                         animations:fadeInBlock
                         completion:NULL];
    }
    else {
        fadeInBlock();
    }
}


#pragma mark - Getters

- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [UIView new];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentView.backgroundColor = [UIColor clearColor];
        _contentView.userInteractionEnabled = YES;
        _contentView.alpha = 0;
    }
    return _contentView;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = NO;
        _imageView.accessibilityIdentifier = @"empty set background image";
        
        [_contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        _titleLabel.font = [UIFont systemFontOfSize:27.0];
        _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        _titleLabel.accessibilityIdentifier = @"empty set title";
        
        [_contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [UILabel new];
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLabel.backgroundColor = [UIColor clearColor];
        
        _detailLabel.font = [UIFont systemFontOfSize:17.0];
        _detailLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _detailLabel.numberOfLines = 0;
        _detailLabel.accessibilityIdentifier = @"empty set detail label";
        
        [_contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.backgroundColor = [UIColor clearColor];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _button.accessibilityIdentifier = @"empty set button";
        
        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [_contentView addSubview:_button];
    }
    return _button;
}

- (BOOL)canShowImage
{
    return (_imageView.image && _imageView.superview);
}

- (BOOL)canShowTitle
{
    return (_titleLabel.attributedText.string.length > 0 && _titleLabel.superview);
}

- (BOOL)canShowDetail
{
    return (_detailLabel.attributedText.string.length > 0 && _detailLabel.superview);
}

- (BOOL)canShowButton
{
    if ([_button attributedTitleForState:UIControlStateNormal].string.length > 0 || [_button imageForState:UIControlStateNormal]) {
        return (_button.superview != nil);
    }
    return NO;
}


#pragma mark - Setters

- (void)setCustomView:(UIView *)view
{
    if (!view) {
        return;
    }
    
    if (_customView) {
        [_customView removeFromSuperview];
        _customView = nil;
    }
    
    _customView = view;
    _customView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_customView];
}


#pragma mark - Action Methods

- (void)didTapButton:(id)sender
{
    SEL selector = NSSelectorFromString(@"_didTapDataButton:");
    
    if ([self.superview respondsToSelector:selector]) {
        [self.superview performSelector:selector withObject:sender afterDelay:0.0f];
    }
}

- (void)removeAllConstraints
{
    [self removeConstraints:self.constraints];
    [_contentView removeConstraints:_contentView.constraints];
}

- (void)prepareForReuse
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _titleLabel = nil;
    _detailLabel = nil;
    _imageView = nil;
    _button = nil;
    _customView = nil;
    
    [self removeAllConstraints];
}


#pragma mark - Auto-Layout Configuration

- (void)setupConstraints
{
    // First, configure the content view constaints
    // The content view must alway be centered to its superview
    NSLayoutConstraint *centerXConstraint = [self equallyRelatedConstraintWithView:self.contentView attribute:NSLayoutAttributeCenterX];
    NSLayoutConstraint *centerYConstraint = [self equallyRelatedConstraintWithView:self.contentView attribute:NSLayoutAttributeCenterY];
    
    [self addConstraint:centerXConstraint];
    [self addConstraint:centerYConstraint];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:nil views:@{@"contentView": self.contentView}]];
    
    // When a custom offset is available, we adjust the vertical constraints' constants
    if (self.verticalOffset != 0 && self.constraints.count > 0) {
        centerYConstraint.constant = self.verticalOffset;
    }
    
    // If applicable, set the custom view's constraints
    if (_customView) {
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customView]|" options:0 metrics:nil views:@{@"customView":_customView}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[customView]|" options:0 metrics:nil views:@{@"customView":_customView}]];
    }
    else {
        CGFloat width = CGRectGetWidth(self.frame) ? : CGRectGetWidth([UIScreen mainScreen].bounds);
        CGFloat padding = roundf(width/16.0);
        CGFloat verticalSpace = self.verticalSpace; // Default is 11 pts
        
        NSMutableArray *subviewStrings = [NSMutableArray array];
        NSMutableDictionary *views = [NSMutableDictionary dictionary];
        NSDictionary *metrics = @{@"padding": @(padding)};
        
        // Assign the image view's horizontal constraints
        if (_imageView.superview) {
            
            [subviewStrings addObject:@"imageView"];
            views[[subviewStrings lastObject]] = _imageView;
            
            [self.contentView addConstraint:[self.contentView equallyRelatedConstraintWithView:_imageView attribute:NSLayoutAttributeCenterX]];
        }
        
        // Assign the title label's horizontal constraints
        if ([self canShowTitle]) {
            
            [subviewStrings addObject:@"titleLabel"];
            views[[subviewStrings lastObject]] = _titleLabel;
            
            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[titleLabel(>=0)]-(padding@750)-|"
                                                                                     options:0 metrics:metrics views:views]];
        }
        // or removes from its superview
        else {
            [_titleLabel removeFromSuperview];
            _titleLabel = nil;
        }
        
        // Assign the detail label's horizontal constraints
        if ([self canShowDetail]) {
            
            [subviewStrings addObject:@"detailLabel"];
            views[[subviewStrings lastObject]] = _detailLabel;
            
            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[detailLabel(>=0)]-(padding@750)-|"
                                                                                     options:0 metrics:metrics views:views]];
        }
        // or removes from its superview
        else {
            [_detailLabel removeFromSuperview];
            _detailLabel = nil;
        }
        
        // Assign the button's horizontal constraints
        if ([self canShowButton]) {
            
            [subviewStrings addObject:@"button"];
            views[[subviewStrings lastObject]] = _button;
            
            NSDictionary *metrics = @{@"padding": @(padding)};

            if (_button.width) {
                padding = [UIScreen mainScreen].bounds.size.width/2-_button.width/2;
                metrics = @{@"padding": @(padding),@"buttonWidth":@(_button.width)};
                [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[button(==buttonWidth)]-(padding@750)-|"
                                                                                         options:0 metrics:metrics views:views]];
            }else{
                [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[button(>=0)]-(padding@750)-|"
                                                                                         options:0 metrics:metrics views:views]];
            }
            
            
        }
        // or removes from its superview
        else {
            [_button removeFromSuperview];
            _button = nil;
        }
        
        
        NSMutableString *verticalFormat = [NSMutableString new];
        
        // Build a dynamic string format for the vertical constraints, adding a margin between each element. Default is 11 pts.
        for (int i = 0; i < subviewStrings.count; i++) {
            
            NSString *string = subviewStrings[i];
            [verticalFormat appendFormat:@"[%@]", string];
            
            if (i < subviewStrings.count-1) {
                if ([string isEqualToString:@"titleLabel"]) {
                    [verticalFormat appendFormat:@"-(%.f@750)-", 24.f];
                }else{
                    [verticalFormat appendFormat:@"-(%.f@750)-", verticalSpace];
                }
            }
        }
        
        // Assign the vertical constraints to the content view
        if (verticalFormat.length > 0) {
            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|%@|", verticalFormat]
                                                                                     options:0 metrics:metrics views:views]];
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    
    // Return any UIControl instance such as buttons, segmented controls, switches, etc.
    if ([hitView isKindOfClass:[UIControl class]]) {
        return hitView;
    }
    
    // Return either the contentView or customView
    if ([hitView isEqual:_contentView] || [hitView isEqual:_customView]) {
        return hitView;
    }
    
    return nil;
}

@end

#pragma mark - UIView+ConstraintBasedLayoutExtensions

@implementation UIView (ConstraintBasedLayoutExtensions)

- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

@end

#pragma mark - WeakObjectContainer

@implementation WeakObjectContainer

- (instancetype)initWithWeakObject:(id)object
{
    self = [super init];
    if (self) {
        _weakObject = object;
    }
    return self;
}

@end

