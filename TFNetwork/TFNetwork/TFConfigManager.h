//
//  TFNetworkManager.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class TFNetworkEnvironment;

@interface TFConfigManager : NSObject

+ (instancetype)sharedManager;

- (NSArray <TFNetworkEnvironment *>*)getEnvironmentList;

@end

NS_ASSUME_NONNULL_END
