//
//  ViewController.m
//  CADisplayLinkTest
//
//  Created by 韩扬 on 2017/3/8.
//  Copyright © 2017年 韩扬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CADisplayLink * timerInC;
@property (nonatomic, strong) UIImageView * imgV;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    //target selector 模式初始化一个实例
    self.timerInC = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeImg)];
    //暂停
    self.timerInC.paused = YES;
    //selector每秒显示多少帧
    self.timerInC.preferredFramesPerSecond = 2;
    
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imgV.contentMode = UIViewContentModeScaleAspectFill;
    self.imgV.center = self.view.center;
    [self.view addSubview:self.imgV];
    
    //加入一个runloop
    [self.timerInC addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    UIButton * btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setFrame:CGRectMake(0, 0, 100, 30)];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    [self.view addSubview:btn];
    [btn setTitle:@"开始播放" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(gifAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeImg
{
    self.currentIndex ++;
    if (self.currentIndex > 3) {
        self.currentIndex = 1;
    }
    self.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",self.currentIndex]];
}

- (void)gifAction
{
    self.timerInC.paused = !self.timerInC.paused;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
