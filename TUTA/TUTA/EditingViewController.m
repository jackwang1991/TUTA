//
//  EditingViewController.m
//  TUTA
//
//  Created by wm on 16/11/18.
//  Copyright © 2016年 wm. All rights reserved.
//

#import "EditingViewController.h"

@interface EditingViewController ()

@end

@implementation EditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)clickBtn:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
