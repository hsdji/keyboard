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

- (void)setAsycnBtn:(UIButton *)asycnBtn{
    
    dispatch_async(dispatch_get_main_queue(), ^{
           self.targetImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://new-img2.ol-img.com/90x64/114/192/liPpATxvC0196.gif"]]];
    });
    
    [UIView animateWithDuration:2.0 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}





































//LoadimageView
-(UIImage *)loadimage{
    
    NSString *path =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSSystemDomainMask, YES).firstObject stringByAppendingString:@"/image"];
    NSFileManager *manage = [NSFileManager defaultManager];
    if (![manage fileExistsAtPath:path])//判读文件是否存在 如果不存在
    {
        NSLog(@"imageFile is not exist");
  __block  BOOL isSuccess;
        dispatch_async(dispatch_get_main_queue(), ^{//异步下载图片 防止主线程阻塞
//                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://new-img2.ol-img.com/90x64/114/192/liPpATxvC0196.gif"]]];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://new-img2.ol-img.com/90x64/114/192/liPpATxvC0196.gif"]];
            isSuccess  = [data writeToFile:path atomically:YES];
            if (isSuccess)
            {
                self.targetImageView.image= [UIImage imageWithData:data];
            }else
            {
                UILabel *lab = [UILabel new];
                lab.frame = CGRectMake((self.view.frame.size.width-60)/2.0, (self.view.frame.size.height-40)/2.0, 100, 40);
                lab.text = @"图片写入失败";
                lab.backgroundColor= [UIColor grayColor];
                lab.alpha = 0.5;
                [UIView animateWithDuration:2.0 animations:^{
                     [self.view addSubview:lab];
                } completion:^(BOOL finished) {
                    [lab removeFromSuperview];
                }];
            }
        });
    
        
    }
    
    return [UIImage new];
}







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    要操作的Animatation目标
    [self loadimage];
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
