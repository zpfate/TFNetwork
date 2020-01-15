//
//  ZLRequestManager.h
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLResponse.h"

typedef void(^ZLResponseBlock)(ZLResponse * _Nonnull response);

NS_ASSUME_NONNULL_BEGIN

@interface ZLRequestManager : NSObject

+ (instancetype)shared ;

- (void)login:(id)parameters success:(ZLResponseBlock)success failure:(ZLResponseBlock)failure;

@end

NS_ASSUME_NONNULL_END
