//
//  netrequestViewController.m
//  company
//
//  Created by ekhome on 16/7/29.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "netrequestViewController.h"

@interface netrequestViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *seroview;

@property (weak, nonatomic) IBOutlet UIScrollView *imageView;

@end

@implementation netrequestViewController

{
    NSArray *imagearr;
    NSInteger num;
}


#pragma -mark loadStyle

- (IBAction)ontbyone:(id)sender {
    if (num>=imagearr.count)
    {
        return;
    }else{
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imagearr[num]]]]];
    image.frame = CGRectMake(0,130*num, 100, 100);
        image.backgroundColor = [UIColor redColor];
    num ++;
    [self.seroview addSubview:image];
      
    }
}



- (IBAction)allLoad:(id)sender {
    for (int i =0; i<imagearr.count; i++)
    {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imagearr[i]]]]];
        image.frame = CGRectMake(40*(num+i)+(40*(num+1+i)), 0, self.view.frame.size.height, 40);
        [self.seroview addSubview:image];
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imagearr = @[@"http://img5.imgtn.bdimg.com/it/u=548305910,2611024863&fm=21&gp=0.jpg",
                 @"http://img1.imgtn.bdimg.com/it/u=3601978692,489436201&fm=21&gp=0.jpg",
                 @"http://img4.imgtn.bdimg.com/it/u=2609853913,1111824423&fm=21&gp=0.jpg",
                 @"http://img4.imgtn.bdimg.com/it/u=3166570502,3109253052&fm=21&gp=0.jpg",
                 @"http://img4.imgtn.bdimg.com/it/u=1556139439,2920075657&fm=21&gp=0.jpg",
                 @"http://img1.imgtn.bdimg.com/it/u=1486182398,264827909&fm=21&gp=0.jpg",
                 @"http://img5.imgtn.bdimg.com/it/u=39919495,155044618&fm=21&gp=0.jpg",
                 @"http://img4.imgtn.bdimg.com/it/u=2896378587,1313451127&fm=21&gp=0.jpg"];
    num =0;
    
      self.seroview.frame = CGRectMake(0, 0, self.view.frame.size.width-40, 10000);
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
