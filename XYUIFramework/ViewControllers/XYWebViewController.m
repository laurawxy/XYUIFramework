//
//  XYWebViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYWebViewController.h"
#import <Masonry/Masonry.h>
#import "XYThemeColor.h"

@interface XYWebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,XYWKDelegate>
@property (nonatomic ,strong) UIProgressView *progressView;
@end

@implementation XYWebViewController

- (void)dealloc{
    //这里需要注意，前面增加过的方法一定要remove掉。
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];

    [self.webView setNavigationDelegate:nil];
    [self.webView setUIDelegate:nil];
    
    [self.userContentController removeScriptMessageHandlerForName:@"sayhello"];
    self.webView = nil;
    [self clearWebCache];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitle:@"网页"];
    
    self.navigationBar.hideBigTitle = YES;
    [self.navigationBar addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(3);
    }];
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.navigationBar.mas_bottom);
    }];
}

- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.progressTintColor = [XYThemeColor webViewProgressColor];
        _progressView.trackTintColor = [UIColor whiteColor];
        _progressView.tintColor = [UIColor whiteColor];
        _progressView.backgroundColor = [UIColor whiteColor];
    }
    return _progressView;
}

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:self.configuration];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _webView;
}

- (WKUserContentController *)userContentController{
    if (!_userContentController) {
        _userContentController = [[WKUserContentController alloc] init];
        [_userContentController addScriptMessageHandler:self.delegateController  name:@"sayhello"];

    }
    return _userContentController;
}

- (WKWebViewConfiguration *)configuration{
    if (!_configuration) {
        _configuration = [[WKWebViewConfiguration alloc]init];
        _configuration.userContentController = self.userContentController;
        _configuration.allowsInlineMediaPlayback = YES;//网页中内嵌的视频
    }
    return _configuration;
}

- (XYWKDelegateController *)delegateController{
    if (!_delegateController) {
        _delegateController = [[XYWKDelegateController alloc]init];
        _delegateController.XYDelegate = self;
    }
    return _delegateController;
}

- (void)setWebUrl:(NSString *)webUrl{
    _webUrl = webUrl;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_webUrl]];
    [self.webView loadRequest:request];

}

- (void)loadLocalFileWithFileName:(NSString*)fileName type:(NSString*)type{
    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@.%@",fileName,type] withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

/**
 清理缓存
 */
- (void)clearWebCache {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [[NSURLCache sharedURLCache] setDiskCapacity:0];
    [[NSURLCache sharedURLCache] setMemoryCapacity:0];
}

#pragma mark - WKScriptMessageHandler
//JS调用OC
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
}


#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)tmpWebView didFinishNavigation:(WKNavigation *)navigation{
    
    if (self.webView.backForwardList.backList.count > 0) {
//        self.navigationItem.leftBarButtonItems = @[self.backItem,self.closeItem];
    }
    
    //oc调用JS
    //say()是JS方法名，completionHandler是异步回调block
    [self.webView evaluateJavaScript:@"say()" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@",result);
    }];
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}
//失败
- (void)webView:(WKWebView *)webView didFailNavigation: (null_unspecified WKNavigation *)navigation withError:(NSError *)error {

    NSLog(@"%@",error);
}

// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView evaluateJavaScript:@"var a = document.getElementsByTagName('a');for(var i=0;i<a.length;i++){a[i].setAttribute('target','');}" completionHandler:nil];
    }
    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}

//权限认证
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        if ([challenge previousFailureCount] == 0) {
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        } else {
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        }
    } else {
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
    }
}

#pragma mark - WKUIDelegate
// 创建一个新的WebView
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
//    return [[WKWebView alloc]init];
    return nil;
}
//提示框
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
//    completionHandler();
}
// 输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    
    [self presentViewController:alertController animated:YES completion:nil];
//    completionHandler();

}
// 确认框
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
//    completionHandler(YES);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            if (self.webView.title.length != 0) {
                [self setNavigationTitle:self.webView.title];
            }
        }else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else if ([keyPath isEqual:@"estimatedProgress"]){
        if (object == self.webView) {
            [self.progressView setAlpha:1.0f];
            [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
            if (self.webView.estimatedProgress  >= 1.0f) {
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self.progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [self.progressView setProgress:0.0f animated:YES];
                }];
            }
        }else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else {
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
