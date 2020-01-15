//
//  ZLHttpClient.h
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLHttpClient : NSObject

+ (ZLHttpClient *)client;

- (void)GET:(NSString *)URLString parameters:(nonnull id)parameters success:(nullable ZLResponseBlock)success failure:(nullable ZLResponseBlock)failure;

- (void)POST:(NSString *)URLString parameters:(nullable id)parameters progress:(nullable void (^)(NSProgress * _Nonnull))downloadProgress success:(nullable ZLResponseBlock)success failure:(nullable ZLResponseBlock)failure;

@end

NS_ASSUME_NONNULL_END
