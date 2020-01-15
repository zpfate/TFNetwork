//
//  ZLRequestConfigController.m
//  TUIKitDemo
//
//  Created by Twisted Fate on 2020/1/14.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "ZLRequestConfigController.h"
#import "ZLRequestConfigCell.h"
#import "ZLRequestConfig.h"
@interface ZLRequestConfigController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *list;
@end

@implementation ZLRequestConfigController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.list = [ZLRequestConfig config].envUrls;
    [self initSubviews];
}



- (void)initSubviews {
    
    self.title = @"环境配置";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(50, CGRectGetMaxY(self.tableView.frame) + 40, kScreenWidth - 100, 50);
    saveButton.backgroundColor = [UIColor tf_colorWithHexString:@"d81e06"];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
}

- (void)saveAction:(UIButton *)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ZLRequestConfigCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(ZLRequestConfigCell.class) forIndexPath:indexPath];
    ZLEnvModel *env = self.list[indexPath.row];
    [cell updateCellWithEnv:env];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.list.count * 80) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:ZLRequestConfigCell.class forCellReuseIdentifier:NSStringFromClass(ZLRequestConfigCell.class)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



@end
