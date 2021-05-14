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

@end

@implementation TFHttpClient


- (TFHttpClient *)initClient {
    if (self = [super init]) {
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
    
}


+ (TFHttpClient *)client {
    TFHttpClient *client = [[[self class] alloc] init];
    client.manager = [[AFHTTPSessionManager alloc] init];
    return client;
}

- (void)POST:(nonnull NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress completion:(TFResponseBlock)completion {
    
    
    [_manager POST:URLString parameters:parameters headers:self.headers progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
    }];
}


@end
