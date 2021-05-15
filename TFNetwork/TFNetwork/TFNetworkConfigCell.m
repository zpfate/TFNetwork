//
//  TFNetworkEnvironmentCell.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import "TFNetworkConfigCell.h"
#import <TFKit_Objc/TFKit-Objc.h>
#import "TFNetworkEnvironment.h"

@interface TFNetworkConfigCell ()

@property (nonatomic, strong) UIButton *selectBtn;

@property (nonatomic, strong) UILabel *envNameLabel;

@property (nonatomic, strong) UITextField *hostTextField;

@end

@implementation TFNetworkConfigCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    
    [self.contentView addSubview:self.selectBtn];
    [self.contentView addSubview:self.envNameLabel];
    [self.contentView addSubview:self.hostTextField];
}

- (void)selectAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)updateCellWithEnvironment:(TFNetworkEnvironment *)environment {
    
    
}

#pragma mark -- Getter

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.frame = CGRectMake(20, 20, 40, 40);
        [_selectBtn setImage:[UIImage imageNamed:@"network_normal"] forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"network_select"] forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

- (UILabel *)envNameLabel {
    if (!_envNameLabel) {
        _envNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 100, 40)];
        _envNameLabel.textColor = [UIColor blackColor];
    }
    return _envNameLabel;
}

- (UITextField *)hostTextField {
    if (!_hostTextField) {
        _hostTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 40, kScreenWidth - 80, 40)];
        _hostTextField.textAlignment = NSTextAlignmentLeft;
        _hostTextField.delegate = self;
        _hostTextField.enabled = NO;
    }
    return _hostTextField;
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
