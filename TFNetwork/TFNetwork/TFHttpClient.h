//
//  TFHttpClient.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import <Foundation/Foundation.h>
#import "TFResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface TFHttpClient : NSObject

@property (nonatomic, strong) NSDictionary <NSString *, NSString *> *headers;

/// get请求
/// @param URLString 网络请求链接
/// @param parameters 参数
/// @param uploadProgress 进度
/// @param completion 完成回调
- (void)GET:(nonnull NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress completion:(TFResponseBlock)completion;

/// post请求
/// @param URLString 网络请求链接
/// @param parameters 参数
/// @param uploadProgress 进度
/// @param completion 完成回调
- (void)POST:(nonnull NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress completion:(TFResponseBlock)completion;


@end

NS_ASSUME_NONNULL_END
