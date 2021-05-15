//
//  ViewController.m
//  TFNetwork
//
//  Created by Twisted Fate on 2021/5/13.
//

#import "ViewController.h"
#import "TFNetwork/TFNetwork.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)openConfig:(id)sender {
    
    [TFConfigManager.sharedManager openNetworkConfigVCInViewController:self];
    
}


@end
