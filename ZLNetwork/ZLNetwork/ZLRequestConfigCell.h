//
//  ZLRequestConfigCell.h
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLRequestConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZLRequestConfigCell : UITableViewCell

- (void)updateCellWithEnv:(ZLEnvModel *)env;

@end

NS_ASSUME_NONNULL_END
