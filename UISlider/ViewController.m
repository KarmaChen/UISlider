//
//  ViewController.m
//  UISlider
//
//  Created by Karma on 16/5/30.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UISlider *mySlider;
@property (strong, nonatomic) UIImageView *myImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myImageView];
    [self mySlider];
}
-(UISlider *)mySlider{
    if (!_mySlider) {
        _mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 300, 375, 10)];
        _mySlider.value = 0.5;//设置当前滑块处于滑动条中间
        _mySlider.continuous = YES;//不连续触发事件
        _mySlider.minimumTrackTintColor = [UIColor redColor];//设置完成部分的轨道颜色为红色
        _mySlider.maximumTrackTintColor = [UIColor blueColor];//设置未完成部分的轨道颜色为蓝色
        _mySlider.thumbTintColor = [UIColor grayColor];//设置滑块颜色为灰色
        [_mySlider addTarget:self action:@selector(change) forControlEvents:UIControlEventValueChanged];//绑定ValueChange方法
        [self.view addSubview:_mySlider];
    }
    return _mySlider;
}
- (void)change{
    [self.myImageView setAlpha:self.mySlider.value];
}
- (UIImageView *)myImageView{
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
        _myImageView.image = [UIImage imageNamed:@"2"];
        _myImageView.alpha = .5;//设置图片刚开始透明度为0.5与滑块对应的value保持一致
        [self.view addSubview:_myImageView];
    }
    return _myImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
