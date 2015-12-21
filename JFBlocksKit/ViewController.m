//
//  ViewController.m
//  JFBlocksKit
//
//  Created by JohnFighting on 15/12/21.
//  Copyright © 2015年 john. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>
/** 红色按钮,左上角20,宽高100,50,点击后打印 'aaa'*/
@property(nonatomic,strong) UIButton *redBtn;
/** 蓝色按钮,右上角20,宽高与红色按钮一样,点击后弹出提示框*/
@property(nonatomic,strong) UIButton *blueBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redBtn.hidden = NO;
    self.blueBtn.hidden = NO;
    [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        NSLog(@"1111");
    } repeats:YES];
}

- (UIButton *)blueBtn{
    if (!_blueBtn) {
        _blueBtn = [UIButton buttonWithType:0];
        _blueBtn.backgroundColor=[UIColor blueColor];
        [self.view addSubview:_blueBtn];
        [_blueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(self.redBtn);
        }];
        //使用blocksKit为蓝色按钮添加点击方法, bk_开头的方法
        [_blueBtn bk_addEventHandler:^(id sender) {
            NSLog(@"点击了蓝色按钮");
            
            [UIAlertView bk_showAlertViewWithTitle:@"蓝色按钮" message:@"Message" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    NSLog(@"取消");
                }
                if (buttonIndex == 1) {
                    NSLog(@"确定");
                }
                
            }];
            
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _blueBtn;
}

- (UIButton *)redBtn {
    if(_redBtn == nil) {
        _redBtn = [[UIButton alloc] init];
        _redBtn.backgroundColor=[UIColor redColor];
        [self.view addSubview:_redBtn];
        [_redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
        [_redBtn addTarget:self
                    action:@selector(clicks:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redBtn;
}
- (void)clicks:(UIButton *)sender{
    NSLog(@"点击了红色按钮");
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"红色按钮" message:@"message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"确定", nil];
    [alertView show];
}
#pragma mark - UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"取消");
    }
    if (buttonIndex == 1) {
        NSLog(@"确定");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
