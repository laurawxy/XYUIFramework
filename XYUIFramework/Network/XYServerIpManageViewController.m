//
//  XYServerIpManageViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYServerIpManageViewController.h"
#import "XYLocalStorageUtil.h"
#import "XYMacroConfig.h"
#import "NSObject+XYUtils.h"
#import "XYNetworkConfig.h"

#define kIpSelectIndex @"IpSelectIndex"

@interface XYServerIpManageViewController ()
@property (nonatomic, assign) NSInteger selectIndex;
@end

@implementation XYServerIpManageViewController

+ (XYServerIpManageViewController*)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[XYServerIpManageViewController alloc] init];
    });
    return sharedInstance;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationTitle:@"服务器地址切换"];
    [self addIpList];
}

- (void)addIpList{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"IpModel.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    
    
    if ([fileM fileExistsAtPath:filePath]) {
        NSMutableArray *ipModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
        [_xyTableView.dataArray addObjectsFromArray:ipModelArray];
    }else{
        [_xyTableView.dataArray addObject:[self currentIpModel]];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IpModel *)currentIpModel{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"IpModel.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    
    
    IpModel *model;
    
    if ([fileM fileExistsAtPath:filePath]) {
        NSMutableArray *ipModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
        if (ipModelArray.count>0) {
            _selectIndex = [[XYLocalStorageUtil getInfo:kIpSelectIndex] integerValue];
            if (ipModelArray.count > _selectIndex) {
                model = [ipModelArray objectAtIndex:_selectIndex];
            }
        }
    }
    
    if (!model) {
        model = [[IpModel alloc] init];
        model.name = @"正式环境";
        model.host = [XYNetworkConfig formalHostUrl];
        model.hostApi = [XYNetworkConfig formalHostApiUrl];
        
        model.wapHost = [XYNetworkConfig formalWapHostUrl];
        model.wapHostApi = [XYNetworkConfig formalWapHostApiUrl];
        
        model.h5Host = [XYNetworkConfig formalH5HostUrl];
        model.noInternetAddress = [XYNetworkConfig formalNoInternetAddressUrl];
    }
    return model;

}

- (void)addIpModel:(IpModel *)ipModel{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"IpModel.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    
    
    if (![fileM fileExistsAtPath:filePath]) {
        [fileM createFileAtPath:filePath contents:nil attributes:nil];
    }
    NSMutableArray *ipModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    if ((ipModelArray.count == 0)) {
        ipModelArray = [NSMutableArray arrayWithCapacity:1];
    }
    [ipModelArray addObject:ipModel];
    
    [NSKeyedArchiver archiveRootObject:ipModelArray toFile:filePath];
}


- (void)addIpModels:(NSArray<IpModel *> *)ipModels{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"IpModel.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    
    
    if (![fileM fileExistsAtPath:filePath]) {
        [fileM createFileAtPath:filePath contents:nil attributes:nil];
    }
    NSMutableArray *ipModelArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    if ((ipModelArray.count == 0)) {
        ipModelArray = [NSMutableArray arrayWithCapacity:1];
    }
    [ipModelArray addObjectsFromArray:ipModels];
    
    [NSKeyedArchiver archiveRootObject:ipModelArray toFile:filePath];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _xyTableView.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"ipListCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    IpModel *model = [_xyTableView.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@(%@)",model.name,model.hostApi];
    if(indexPath.row == _selectIndex){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消前一个选中的，就是单选啦
    NSIndexPath *lastIndex = [NSIndexPath indexPathForRow:_selectIndex inSection:0];
    UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:lastIndex];
    lastCell.accessoryType = UITableViewCellAccessoryNone;
    
    // 选中操作
    UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    _selectIndex = indexPath.row;
    
    [XYLocalStorageUtil setInfo:[NSString stringWithFormat:@"%ld",(long)_selectIndex] forKey:kIpSelectIndex];

    if (_selectIpBlock) {
        IpModel *model = [_xyTableView.dataArray objectAtIndex:indexPath.row];
        _selectIpBlock(model);
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

#define ipModel_name @"ipModel_name"

#define ipModel_host @"ipModel_host"
#define ipModel_hostApi @"ipModel_hostApi"

#define ipModel_wapHost @"ipModel_wapHost"
#define ipModel_wapHostApi @"ipModel_wapHostApi"

#define ipModel_h5Host @"ipModel_h5Host"

#define ipModel_noInternetAddress @"ipModel_noInternetAddress"

@implementation IpModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:ipModel_name];
    
    [aCoder encodeObject:self.host forKey:ipModel_host];
    [aCoder encodeObject:self.hostApi forKey:ipModel_hostApi];
    
    [aCoder encodeObject:self.wapHost forKey:ipModel_wapHost];
    [aCoder encodeObject:self.wapHostApi forKey:ipModel_wapHostApi];
    
    [aCoder encodeObject:self.h5Host forKey:ipModel_h5Host];
    
    [aCoder encodeObject:self.noInternetAddress forKey:ipModel_noInternetAddress];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:ipModel_name];
        
        self.host = [aDecoder decodeObjectForKey:ipModel_host];
        self.hostApi = [aDecoder decodeObjectForKey:ipModel_hostApi];

        self.wapHost = [aDecoder decodeObjectForKey:ipModel_wapHost];
        self.wapHostApi = [aDecoder decodeObjectForKey:ipModel_wapHostApi];

        self.h5Host = [aDecoder decodeObjectForKey:ipModel_h5Host];
        
        self.noInternetAddress = [aDecoder decodeObjectForKey:ipModel_noInternetAddress];

    }
    
    return self;
}
    
@end
