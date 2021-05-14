//
//  TFNetworkManager.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import "TFNetworkManager.h"
#import "TFNetworkEnvironment.h"
@interface TFNetworkManager ()

@property (nonatomic, strong) NSURL *baseURL;

@property (nonatomic, strong) NSArray <TFNetworkEnvironment *>*environments;

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

- (BOOL)loadNetworkEnvironmens:(NSArray <TFNetworkEnvironment *>*)environments {

    self.environments = environments;
    return YES;
    
}

+ (BOOL)loadNetworkConfigAtPath:(NSString *)path {
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *err;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    return YES;
}

- (void)configBaseURLString:(NSString *)urlString {
    self.baseURL = [NSURL URLWithString:urlString];
}


@end
