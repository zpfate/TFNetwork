//
//  TFHttpClient.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import "TFHttpClient.h"
#import <AFNetworking/AFNetworking.h>
#import "TFConfigManager.h"
#import <TFKit_Objc/TFKit-Objc.h>
@interface TFHttpClient ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation TFHttpClient

+ (TFHttpClient *)client {
    TFHttpClient *client = [[[self class] alloc] init];
    NSURL *url = [[TFConfigManager sharedManager] getBaseURL];
    client.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    client.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    client.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    return client;
}

- (void)POST:(nonnull NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress completion:(TFResponseBlock)completion {
    
    [_manager POST:URLString parameters:parameters headers:self.headers progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        TFResponse *response = [self handleTask:task responseObject:responseObject error:nil];
        BLOCK_EXEC(completion, response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TFResponse *response = [self handleTask:task responseObject:nil error:error];
        BLOCK_EXEC(completion, response);
    }];
}

- (void)GET:(nonnull NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress completion:(TFResponseBlock)completion {
    
    [_manager GET:URLString parameters:parameters headers:self.headers progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TFResponse *response = [self handleTask:task responseObject:responseObject error:nil];
        BLOCK_EXEC(completion, response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TFResponse *response = [self handleTask:task responseObject:nil error:error];
        BLOCK_EXEC(completion, response);
    }];
    
}

- (TFResponse *)handleTask:(NSURLSessionDataTask *)task responseObject:(nullable id)responseObject error:(NSError *)error {
    
    TFResponse *response = [[TFResponse alloc] init];
    if (error) {
        response.isSuccess = NO;
        NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse *)task.response;
        response.code = URLResponse.statusCode;
        NSDictionary *userInfo = [[NSDictionary alloc] initWithDictionary:error.userInfo];
        if ([userInfo.allKeys containsObject:@"body"]) {
                NSString *bodyStr = userInfo[@"body"];
                NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *body = [NSJSONSerialization JSONObjectWithData:bodyData options:0 error:nil];
                if ([body.allKeys containsObject:@"message"]) {
                    if (![body[@"message"] isKindOfClass:[NSNull class]]) {
                        response.errorMsg = body[@"message"];
                    }
                }
                if ([body.allKeys containsObject:@"code"]) {
                    if (![[body objectForKey:@"code"] isKindOfClass:[NSNull class]]) {
                        response.code = [body tf_integerForKey:@"code"];
                    }
                }
            }
    } else {
        response.isSuccess = YES;
        response.code = [responseObject tf_integerForKey:@"statusCode"];
        response.data = responseObject[@"data"];
    }
    return response;
}

@end
