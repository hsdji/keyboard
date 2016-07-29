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
    
   }















- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}






















//LoadimageView
-(UIImage *)loadimage{
    
    NSString *path =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES).firstObject stringByAppendingString:@"/image.dpf"];
    NSFileManager *manage = [NSFileManager defaultManager];
    if (![manage fileExistsAtPath:path])//判读文件是否存在 如果不存在
    {
        NSLog(@"imageFile is not exist");
        dispatch_async(dispatch_get_main_queue(), ^{//异步下载图片 防止主线程阻塞
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://new-img2.ol-img.com/90x64/114/192/liPpATxvC0196.gif"]];
            NSMutableDictionary *dic = [NSMutableDictionary new];
            dic[@"image"] = data;
            [dic writeToFile:path atomically:YES];
        });
    }else{
        self.targetImageView.image = [UIImage imageWithData:[[NSDictionary dictionaryWithContentsOfFile:path] valueForKey:@"image"]];
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
