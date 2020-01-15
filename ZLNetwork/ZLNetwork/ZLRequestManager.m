//
//  ZLRequestManager.m
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "ZLRequestManager.h"
#import "ZLHttpClient.h"

@interface ZLRequestManager ()


@end

@implementation ZLRequestManager

+ (instancetype)shared {
    return [[[self class] alloc] init];
}

- (void)login:(id)parameters success:(ZLResponseBlock)success failure:(ZLResponseBlock)failure {
    
    [[ZLHttpClient client] POST:@"IMLogin" parameters:parameters progress:nil success:^(ZLResponse * _Nonnull response) {
        BLOCK_EXEC(success, response);
    } failure:^(ZLResponse * _Nonnull response) {
        BLOCK_EXEC(failure, response);
    }];
}

- (void)loginOut:(id)parameters success:(ZLResponseBlock)success failure:(ZLResponseBlock)failure {
    
    
}


@end
