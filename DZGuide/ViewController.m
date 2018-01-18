//
//  ViewController.m
//  DZGuide
//
//  Created by dozening on 2018/1/18.
//  Copyright © 2018年 dozening. All rights reserved.
//

//简单引导应该怎么做，添加蒙层视图，再将需要显示的视图挪在蒙层之上
#import "ViewController.h"
#import <Masonry.h>

@interface ViewController (){
    UIImageView* _iv;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}
- (void)setupView{
    self.view.backgroundColor = [UIColor lightTextColor];
    
    UILabel* label = [[UILabel alloc]init];
    label.text = @"shahskjlkjaksjalkjkj l大几数据库";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    
    UIView* superView = [[UIView alloc]init];
    superView.frame = self.view.frame;
    [self.view addSubview:superView];
    
    UIImageView* switchiv = [[UIImageView alloc]init];
    switchiv.userInteractionEnabled = YES;
    switchiv.image = [UIImage imageNamed:@"Shape"];
    [superView addSubview:switchiv];
    [switchiv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [switchiv addGestureRecognizer:tap];
    
    
    UIImageView* iv = [[UIImageView alloc]init];
    _iv = iv;
    iv.image = [UIImage imageNamed:@"摄像头切换1"];
    [superView addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [superView bringSubviewToFront:switchiv];
}
- (void)click{
    _iv.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
