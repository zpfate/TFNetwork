//
//  TFNetworkManager.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import "TFNetworkManager.h"
#import "TFNetworkConfig.h"
@interface TFNetworkManager ()

@property (nonatomic, strong) NSURL *baseURL;

@property (nonatomic, strong) NSArray <TFNetworkConfig *>*environments;

@end

@implementation TFNetworkManager

+ (instancetype)sharedManager {
    
    static TFNetworkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TFNetworkManager alloc] init];
    });
    return manager;
}

+ (BOOL)loadNetworkConfigAtPath:(NSString *)path {
    
}

- (void)configBaseURLString:(NSString *)urlString {
    self.baseURL = [NSURL URLWithString:urlString];
}


@end
