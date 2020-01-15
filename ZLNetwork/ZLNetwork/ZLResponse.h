//
//  ZLReponse.h
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLResponse : NSObject

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) id data;
@property (nonatomic, assign) NSInteger statusCode;
@property (nonatomic, strong) NSString *errMsg;

@end

NS_ASSUME_NONNULL_END
