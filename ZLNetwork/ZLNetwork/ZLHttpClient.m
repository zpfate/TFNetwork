//
//  ZLHttpClient.m
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "ZLHttpClient.h"
#import <AFNetworking.h>


@interface ZLHttpClient ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation ZLHttpClient

- (instancetype)init {
    if (self = [super init]) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://shop-c.zhilun-integration-major.com/"]];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [_manager.requestSerializer setTimeoutInterval:10];
    }
    return self;
}

+ (ZLHttpClient *)client {
    
    ZLHttpClient *client = [[[self class] alloc] init];
    return client;
}

+ (ZLHttpClient *)loginClient {
    ZLHttpClient *client = [[[self class] alloc] init];
    return client;
}

- (void)GET:(NSString *)URLString parameters:(nonnull id)parameters success:(nullable ZLResponseBlock)success failure:(nullable ZLResponseBlock)failure {
    
    [self.manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


- (void)POST:(NSString *)URLString parameters:(nullable id)parameters progress:(nullable void (^)(NSProgress * _Nonnull))downloadProgress success:(nullable ZLResponseBlock)success failure:(nullable ZLResponseBlock)failure {

    [self.manager POST:URLString parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ZLResponse *response = [self handleTask:task responseObject:responseObject error:nil];
        BLOCK_EXEC(success, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZLResponse *response = [self handleTask:task responseObject:nil error:error];
        BLOCK_EXEC(failure, response);
    }];
}

- (ZLResponse *)handleTask:(NSURLSessionDataTask *)task responseObject:(nullable id)responseObject error:(NSError *)error {
    
    ZLResponse *response = [[ZLResponse alloc] init];
    if (error) {
        response.success = NO;
        NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse *)task.response;
        response.statusCode = URLResponse.statusCode;
    } else {
        response.success = YES;
        response.statusCode = [responseObject tf_integerForKey:@"statusCode"];
        response.data = [responseObject tf_stringForKey:@"data"];
    }
    return response;
}

@end
