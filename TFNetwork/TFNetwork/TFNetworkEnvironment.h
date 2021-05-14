//
//  TFNetworkEnvironment.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFNetworkEnvironment : NSObject

/// 环境名称
@property (nonatomic, strong) NSString *environment;

/// 域名
@property (nonatomic, strong) NSString *urlString;

/// 端口号
@property (nonatomic, strong) NSString *port;

/// 是否选中
@property (nonatomic, assign) BOOL selected;

@end

NS_ASSUME_NONNULL_END
