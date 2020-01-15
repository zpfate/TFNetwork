//
//  ZLRequestConfigCell.m
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "ZLRequestConfigCell.h"

@interface ZLRequestConfigCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, strong) UILabel *envLabel;

@property (nonatomic, strong) UITextField *urlTextField;

@end

@implementation ZLRequestConfigCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.selectButton];
        [self.contentView addSubview:self.envLabel];
        [self.contentView addSubview:self.urlTextField];
    }
    return self;
}

- (void)selectAction:(UIButton *)sender {
    
    UITableView *tableView = (UITableView *)self.superview;
    [tableView reloadData];
}

- (void)updateCellWithEnv:(ZLEnvModel *)env {

    self.envLabel.text = env.envName;
    self.urlTextField.text = env.baseURL;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- Getter

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.frame = CGRectMake(20, 20, 40, 40);
        [_selectButton setImage:[UIImage imageNamed:@"network_normal"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"network_select"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UILabel *)envLabel {
    if (!_envLabel) {
        _envLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 100, 40)];
        _envLabel.textColor = [UIColor blackColor];
    }
    return _envLabel;
}

- (UITextField *)urlTextField {
    if (!_urlTextField) {
        _urlTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 40, kScreenWidth - 80, 40)];
        _urlTextField.textAlignment = NSTextAlignmentLeft;
        _urlTextField.delegate = self;
        _urlTextField.enabled = NO;
    }
    return _urlTextField;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
