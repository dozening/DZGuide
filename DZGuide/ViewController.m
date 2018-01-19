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
    UIImageView* _switchiv;
    UIView* _superView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    [self addMonsoryAnimate];
    
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
    _superView = superView;
    superView.frame = self.view.frame;
    [self.view addSubview:superView];
    
    UIImageView* switchiv = [[UIImageView alloc]init];
    _switchiv = switchiv;
    switchiv.userInteractionEnabled = YES;
    switchiv.image = [UIImage imageNamed:@"Shape"];
    [superView addSubview:switchiv];
    [switchiv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-0);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
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
- (void)addMonsoryAnimate{
    
    [_superView layoutIfNeeded];//如果其约束还没有生成的时候需要动画的话，就请先强制刷新后才写动画，否则所有没生成的约束会直接跑动画

    [UIView animateWithDuration:0.6 animations:^{
        [_switchiv mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(-10);
            
        }];
        
        [_superView layoutIfNeeded];//强制绘制
    } completion:^(BOOL finished) {
        //创建动画
        CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
        keyAnimaion.keyPath = @"transform.rotation";
        keyAnimaion.values = @[@(-10 / 180.0 * M_PI),@(10 /180.0 * M_PI),@(-10/ 180.0 * M_PI)];//度数转弧度
        
        keyAnimaion.removedOnCompletion = NO;
        keyAnimaion.fillMode = kCAFillModeForwards;
        keyAnimaion.duration = 0.3;
        keyAnimaion.repeatCount = MAXFLOAT;
        [_switchiv.layer addAnimation:keyAnimaion forKey:nil];
        

    }];
}
- (void)click{
    [_switchiv.layer removeAllAnimations];
    _iv.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
