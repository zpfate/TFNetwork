//
//  TFHttpClient.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import <Foundation/Foundation.h>
#import "TFResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface TFHttpClient : NSObject

@property (nonatomic, strong) NSDictionary <NSString *, NSString *> *headers;

@end

NS_ASSUME_NONNULL_END
