//
//  ViewController.m
//  company
//
//  Created by ekhome on 16/7/28.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *CardNo;

@property (weak, nonatomic) IBOutlet UITextField *blandCard;

@property (weak, nonatomic) IBOutlet UITextField *blandKind;

@property (weak, nonatomic) IBOutlet UITextField *employNo;

@property (weak, nonatomic) IBOutlet UITextField *socailNo;

@property (weak, nonatomic) IBOutlet UITextField *sex;

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *boderData;

@property (weak, nonatomic) IBOutlet UITextField *height;

@end

@implementation ViewController


#pragma -mark UItextFiledDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 300.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.CardNo.delegate =self;
    self.blandCard.delegate =self;
    self.blandKind.delegate =self;
    self.employNo.delegate =self;
    self.socailNo.delegate =self;
    self.sex.delegate =self;
    self.name.delegate =self;
    self.boderData.delegate =self;
    self.height.delegate =self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
