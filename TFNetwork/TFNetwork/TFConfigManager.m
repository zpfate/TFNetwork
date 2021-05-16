//
//  TFNetworkManager.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import "TFConfigManager.h"
#import "TFNetworkEnvironment.h"
#import "TFNetworkConfigVC.h"

@interface TFConfigManager ()

@property (nonatomic, strong) TFNetworkEnvironment *currentEnvironment;

@property (nonatomic, strong) NSArray <TFNetworkEnvironment *>*environments;

@end

@implementation TFConfigManager

+ (instancetype)sharedManager {
    
    static TFConfigManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TFConfigManager alloc] init];
    });
    return manager;
}

/// 打开配置页面
- (void)openNetworkConfigVCInViewController:(UIViewController *)vc {
    
    TFNetworkConfigVC *configVC = [[TFNetworkConfigVC alloc] init];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:configVC];
    naVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [vc presentViewController:naVC animated:YES completion:nil];
}

/// 选择配置
- (void)changeConfigWithEnvironment:(TFNetworkEnvironment *)environment {
    
    for (TFNetworkEnvironment *env in self.environments) {
        env.selected = NO;
    }
    environment.selected = YES;
}

- (BOOL)loadNetworkEnvironmens:(NSArray <TFNetworkEnvironment *>*)environments {
    self.environments = environments;
    return YES;
}

+ (BOOL)loadNetworkConfigAtPath:(NSString *)path {
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *err;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    return YES;
}

- (NSURL *)getBaseURL {
    NSString *urlString = self.currentEnvironment.urlString;
    return [NSURL URLWithString:urlString];
}

- (NSArray<TFNetworkEnvironment *> *)getEnvironmentList {
    return self.environments;
}

@end
