//
//  TFNetworkManager.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TFNetworkEnvironment;

@interface TFConfigManager : NSObject

+ (instancetype)sharedManager;

/// 加载网络环境配置
/// @param environments 网络环境配置数组
- (BOOL)loadNetworkEnvironmens:(NSArray <TFNetworkEnvironment *>*)environments;

/// 打开网络环境配置页面
/// @param vc 当前vc
- (void)openNetworkConfigVCInViewController:(UIViewController *)vc;

/// 检测是否当前环境
/// @param environment 环境配置
- (BOOL)checkCurrentEnvironment:(TFNetworkEnvironment *)environment;

/// 更改当前环境配置
/// @param currentEnvironment 要更改的环境配置
- (void)setCurrentEnvironment:(TFNetworkEnvironment *)currentEnvironment;

/// 更改网络环境配置
/// @param environment 要更改的配置
- (void)changeConfigWithEnvironment:(TFNetworkEnvironment *)environment;

/// 获取baseURL
- (NSURL *)getBaseURL;

/// 获取网络环境配置数组
- (NSArray <TFNetworkEnvironment *>*)getEnvironmentList;

@end

NS_ASSUME_NONNULL_END
