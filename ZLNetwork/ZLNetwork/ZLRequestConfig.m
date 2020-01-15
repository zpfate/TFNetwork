//
//  ZLRequestConfig.m
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "ZLRequestConfig.h"
#import "ZLRequestConfigController.h"
// IP
static NSString *const kZLDebugIP = @"http://192.168.30.80:8080/";
// 联调主
static NSString *const kZLDebugMajorBaseURL  = @"";
// 联调次
static NSString *const kZLDebugMinorBaseURL  = @"";
// 测试主
static NSString *const kZLTestMajorBaseURL   = @"";
// 测试次
static NSString *const kZLTestMinorBaseURL   = @"";
// 准生产
static NSString *const kZLPreDistribution    = @"";
// 生产
static NSString *const kZLDistribution        = @"";


@implementation ZLEnvModel

- (instancetype)initWithEnvName:(NSString *)envName baseURL:(NSString *)baseURL {
    if (self = [super init]) {
        _envName = envName;
        _baseURL = baseURL;
    }
    return self;
}

@end


@interface ZLRequestConfig ()

@property (nonatomic, strong) NSString *baseURL;

@end

@implementation ZLRequestConfig

+ (instancetype)config {
    static ZLRequestConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[ZLRequestConfig alloc] init];
    });
    return config;
}

- (void)presentConfigViewControllerIn:(UIViewController *)currentVC {
    
    ZLRequestConfigController *configVC = [[ZLRequestConfigController alloc] init];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:configVC];
    naVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [currentVC presentViewController:naVC animated:YES completion:nil];
}


- (NSArray *)envUrls {
    ZLEnvModel *ip = [[ZLEnvModel alloc] initWithEnvName:@"IP" baseURL:kZLDebugIP];
    ZLEnvModel *debugMajor = [[ZLEnvModel alloc] initWithEnvName:@"联调主" baseURL:kZLDebugMajorBaseURL];
    ZLEnvModel *debugMinor = [[ZLEnvModel alloc] initWithEnvName:@"联调次" baseURL:kZLDebugMinorBaseURL];
    ZLEnvModel *testMajor = [[ZLEnvModel alloc] initWithEnvName:@"测试主" baseURL:kZLTestMajorBaseURL];
    ZLEnvModel *testMinor = [[ZLEnvModel alloc] initWithEnvName:@"测试次" baseURL:kZLTestMinorBaseURL];
    ZLEnvModel *pre = [[ZLEnvModel alloc] initWithEnvName:@"准生产" baseURL:kZLPreDistribution];
    ZLEnvModel *dis = [[ZLEnvModel alloc] initWithEnvName:@"生产" baseURL:kZLDistribution];
    return @[ip, debugMajor, debugMinor, testMajor, testMinor, pre, dis];
}


@end
