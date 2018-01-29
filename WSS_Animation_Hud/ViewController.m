//
//  ViewController.m
//  WSS_Animation_Hud
//
//  Created by 王少帅 on 2018/1/29.
//  Copyright © 2018年 王少帅. All rights reserved.
//

#define kWIDTH                  [UIScreen mainScreen].bounds.size.width
#define kHEIGHT                 [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "HudView.h"

@interface ViewController ()

@property(nonatomic, strong) HudView *hudView;

@end

@implementation ViewController

- (HudView *)hudView {
    if (!_hudView) {
        _hudView = [[HudView alloc] initWithFrame:CGRectMake(120, kHEIGHT*0.5-100, kWIDTH-240, 150)];
        _hudView.labelText = @"正在加载···";
    }
    return _hudView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgV.image = [UIImage imageNamed:@"second"];
    [self.view addSubview:imgV];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(showHud) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"弹出Hud,4秒hid" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    [btn setTitleColor:[UIColor colorWithRed:0.24 green:0.45 blue:0.96 alpha:1.00] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    CGSize V_size = self.view.frame.size;
    CGFloat btn_height = 60.0f;
    btn.frame = CGRectMake(0, V_size.height - btn_height, V_size.width, btn_height);
    
}

- (void)showHud {
    [self.view addSubview:self.hudView];
    [self.hudView.imgView startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hudView removeFromSuperview];
        [self.hudView.imgView stopAnimating];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
