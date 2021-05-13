//
//  TFResponse.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TFResponse;
typedef void(^TFResponseBlock)(TFResponse *response);

@interface TFResponse : NSObject

/// 网络请求成功与否
@property (nonatomic, assign) BOOL isSuccess;
/// 请求完成的结果
@property (nonatomic, strong) id data;
/// 请求状态码
@property (nonatomic, assign) NSInteger code;
/// 请求失败的提示
@property (nonatomic, strong) NSString *errorMsg;


@end

NS_ASSUME_NONNULL_END
