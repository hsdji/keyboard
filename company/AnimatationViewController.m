//
//  AnimatationViewController.m
//  company
//
//  Created by ekhome on 16/7/28.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "AnimatationViewController.h"

@interface AnimatationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *targetImageView;
/**           异步加载                         */
@property (weak, nonatomic) IBOutlet UIButton *asycnBtn;
/**           边加载边显示按钮            */
@property (weak, nonatomic) IBOutlet UIButton *showbtn;
/**           下载完毕后加载               */
@property (weak, nonatomic) IBOutlet UIButton *afterDownLadShow;
/**           主线程同步下载加载            */
@property (weak, nonatomic) IBOutlet UIButton *btn1;
/**           主线程异步加载            */
@property (weak, nonatomic) IBOutlet UIButton *btn2;
/**           拉伸动画            */
@property (weak, nonatomic) IBOutlet UIButton *lashenbtn;
/**           位移动画            */
@property (weak, nonatomic) IBOutlet UIButton *weiyibtn;
/**           反转动画            */
@property (weak, nonatomic) IBOutlet UIButton *fanzhuanBtn;
/**           放大动画            */
@property (weak, nonatomic) IBOutlet UIButton *fangdabtn;
/**           透明度动画            */
@property (weak, nonatomic) IBOutlet UIButton *toumingdubtn;

@end

@implementation AnimatationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
