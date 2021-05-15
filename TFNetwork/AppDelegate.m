//
//  AppDelegate.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import "AppDelegate.h"
#import "TFNetwork/TFNetwork.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    TFNetworkEnvironment *env1 = [[TFNetworkEnvironment alloc] init];
    env1.environment = @"开发";
    env1.selected = YES;
    env1.urlString = @"http://www.baidu.com/debug";
    TFNetworkEnvironment *env2 = [[TFNetworkEnvironment alloc] init];
    env2.environment = @"联调";
    env2.urlString = @"http://www.baidu.com/integration";
    TFNetworkEnvironment *env3 = [[TFNetworkEnvironment alloc] init];
    env3.environment = @"测试";
    env3.urlString = @"http://www.baidu.com/test";
    TFNetworkEnvironment *env4 = [[TFNetworkEnvironment alloc] init];
    env4.environment = @"准生产";
    env4.urlString = @"http://www.baidu.com/preProduction";
    TFNetworkEnvironment *env5 = [[TFNetworkEnvironment alloc] init];
    env5.environment = @"生产";
    env5.urlString = @"http://www.baidu.com/production";
    
    NSArray *environments = @[env1, env2, env3, env4, env5];
    [TFConfigManager.sharedManager loadNetworkEnvironmens:environments];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


@end
