//
//  registerViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/12.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "registerViewController.h"
#import "UIView+SDAutoLayout.h"

@interface registerViewController ()
{
    
    UITextField *phonenumber,*passedcode,*securitycode;
    
    
    
}

@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"用户注册";
    self.view.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    
    
    UIImageView *imageview=[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:@"icon_logo.png"];
    [self.view addSubview:imageview];
    
    
    UILabel *labelphone=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    labelphone.text=@"手机号：";
    labelphone.textAlignment=NSTextAlignmentRight;
    phonenumber=[[UITextField alloc]init];
    phonenumber.backgroundColor=[UIColor whiteColor];
    phonenumber.leftView=labelphone;
    phonenumber.leftViewMode=UITextFieldViewModeAlways;
    phonenumber.layer.borderColor=[UIColor blackColor].CGColor;
    phonenumber.layer.borderWidth=1;
    phonenumber.placeholder=@"请输入手机号码";
    [self.view addSubview:phonenumber];
    
    UILabel *labelpassedcode=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    labelpassedcode.text=@"密码：";
    labelpassedcode.textAlignment=NSTextAlignmentRight;
    passedcode=[[UITextField alloc]init];
    passedcode.backgroundColor=[UIColor whiteColor];
    passedcode.leftView=labelpassedcode;
    passedcode.leftViewMode=UITextFieldViewModeAlways;
    passedcode.layer.borderColor=[UIColor blackColor].CGColor;
    passedcode.layer.borderWidth=1;
    passedcode.placeholder=@"6-14位，建议数字、字母混合";
    [self.view addSubview:passedcode];

    
    
    
    
    imageview.sd_layout
    .topSpaceToView(self.view,20)
    .centerXEqualToView(self.view)
    .widthIs(210)
    .heightIs(45);
    
    phonenumber.sd_layout
    .topSpaceToView(imageview,15)
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .heightIs(50);
    
    passedcode.sd_layout
    .topSpaceToView(phonenumber,10)
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .heightIs(50);
    
    
    
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
