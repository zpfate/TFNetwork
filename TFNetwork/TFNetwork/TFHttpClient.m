//
//  TFHttpClient.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import "TFHttpClient.h"
#import <AFNetworking/AFNetworking.h>
@interface TFHttpClient ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSString *httpHeaders;
@end

@implementation TFHttpClient

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

+ (TFHttpClient *)client {
    TFHttpClient *client = [[[self class] alloc] init];
    return client;
}

- (void)POST:(nonnull NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress completion:(TFResponseBlock)completion {
    
    [_manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
    }];
}



@end
