//
//  TabBarViewController.m
//  TUTA
//
//  Created by wm on 16/11/18.
//  Copyright © 2016年 wm. All rights reserved.
//

#import "TabBarViewController.h"
#import "EditingViewController.h"
#import "MineViewController.h"
#import "MessageViewController.h"
#import "AttentionViewController.h"
#import "DiscoverViewController.h"

@interface TabBarViewController (){
    NSUInteger _lastSlectedIndes;
}
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBarController];
    [self createEditingBtn];
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)createTabBarController {
    //发现
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    UINavigationController *discoverNavi = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    discoverNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    
    //关注
    AttentionViewController *attentionVC = [[AttentionViewController alloc] init];
    UINavigationController *attentionNavi = [[UINavigationController alloc] initWithRootViewController:attentionVC];
    attentionNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"2" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    
    //编辑
    UIViewController *editingVC = [[UIViewController alloc] init];
    UINavigationController *editingNavi = [[UINavigationController alloc] initWithRootViewController:editingVC];
    editingNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    
    //消息
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNavi = [[UINavigationController alloc] initWithRootViewController:messageVC];
    messageNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"4" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    
    //我的
    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNavi = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"5" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    
    self.viewControllers = @[discoverNavi,attentionNavi,editingNavi,messageNavi,mineNavi];
}

- (void)createEditingBtn {
    UIButton *btn = [[UIButton alloc] init];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 0, 60, 40);
    btn.center = CGPointMake(self.view.center.x, self.view.center.y+self.view.frame.size.height/2-25);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 20.0f;
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(clickBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLongGesture:)];
    longGesture.minimumPressDuration = 1.0f;
    [btn addGestureRecognizer:longGesture];
}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

//模态跳转
- (void)presentVC {
    UIViewController *vc = [self getCurrentVC];
    EditingViewController *editingVC = [[EditingViewController alloc] init];
    [vc presentViewController:editingVC animated:YES completion:^{
    }];
}

#pragma mark - event
- (void)clickBtn:(UIButton *)btn {
    btn.backgroundColor = [UIColor redColor];
    [self presentVC];
}
- (void)clickBtnTouchDown:(UIButton *)btn {
    btn.backgroundColor = [UIColor grayColor];
}
- (void)btnLongGesture:(UILongPressGestureRecognizer *)longPress {
    UIButton *btn = (UIButton *)longPress.view;
    
    if ([longPress state] == UIGestureRecognizerStateBegan) {
        btn.backgroundColor = [UIColor redColor];
        [self presentVC];
    }
    
}


#pragma mark - tabBarController代理
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (viewController == [tabBarController.viewControllers objectAtIndex:2]) {
        return NO;
    }else {
        return YES;
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *) viewController {

}

@end
