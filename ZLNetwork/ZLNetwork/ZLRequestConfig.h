//
//  ZLRequestConfig.h
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface ZLEnvModel : NSObject

@property (nonatomic, strong) NSString *envName;
@property (nonatomic, strong) NSString *baseURL;

- (instancetype)initWithEnvName:(NSString *)envName baseURL:(NSString *)baseURL;

@end

@interface ZLRequestConfig : NSObject

@property (nonatomic, strong) NSString *currentEnv;

@property (nonatomic, strong) NSDictionary *urlsDict;

+ (instancetype)config;
- (NSArray *)envUrls;
- (void)presentConfigViewControllerIn:(UIViewController *)currentVC;

@end

NS_ASSUME_NONNULL_END
