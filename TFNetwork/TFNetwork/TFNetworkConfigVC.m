//
//  TFNetworkEnvironmentVC.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/14.
//

#import "TFNetworkConfigVC.h"
#import <TFKit_Objc/TFKit-Objc.h>
#import "TFConfigManager.h"
#import "TFNetworkConfigCell.h"
@interface TFNetworkConfigVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *list;

@end

@implementation TFNetworkConfigVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.list = TFConfigManager.sharedManager.getEnvironmentList;
    
    self.title = @"环境配置";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(50, kScreenHeight - kBottomSafeAreaHeight - 20 - 50, kScreenWidth - 100, 50);
    saveButton.backgroundColor = [UIColor tf_colorWithHexString:@"d81e06"];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
}

- (void)saveAction:(UIButton *)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- UITableViewDelegate && UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TFNetworkConfigCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TFNetworkConfigCell.class) forIndexPath:indexPath];
    TFNetworkEnvironment *env = self.list[indexPath.row];
    [cell updateCellWithEnvironment:env];
    
    cell.selecteEnvironmentBlock = ^{
      /// 切换环境
    };
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        CGFloat saveBtnHeight = 50.f;
        CGFloat bottomSafe = kBottomSafeAreaHeight + 20;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 40 - saveBtnHeight - bottomSafe) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView registerClass:TFNetworkConfigCell.class forCellReuseIdentifier:NSStringFromClass(TFNetworkConfigCell.class)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
