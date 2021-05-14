//
//  TFNetworkEnvironment.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import "TFNetworkEnvironment.h"
#import <TFKit_Objc/TFKit-Objc.h>

@interface TFNetworkEnvironment ()

@end

@implementation TFNetworkEnvironment

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _environment = [dict tf_stringForKey:@"environment"];
        _urlString = [dict tf_stringForKey:@"urlString"];
        _port = [dict tf_stringForKey:@"port"];
        _selected = [dict tf_integerForKey:@"selected"];
    }
    return self;
}

@end
