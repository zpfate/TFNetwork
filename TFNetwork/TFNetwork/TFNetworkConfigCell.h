//
//  TFNetworkEnvironmentCell.h
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TFNetworkEnvironment;
@interface TFNetworkConfigCell : UITableViewCell

@property (nonatomic, copy) void(^selecteEnvironmentBlock)(void);

- (void)updateCellWithEnvironment:(TFNetworkEnvironment *)environment;

@end

NS_ASSUME_NONNULL_END
