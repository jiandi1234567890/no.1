//
//  findcodeViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/12.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "findcodeViewController.h"
#import "UIView+SDAutoLayout.h"

@interface findcodeViewController ()
{
    UITextField *name,*newcode,*requirecode,*securitycode;
}

@end

@implementation findcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.navigationItem.title=@"找回密码";
    self.view.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    label1.text=@"用户账号：";
    label1.textAlignment=NSTextAlignmentRight;
    name=[[UITextField alloc]init];
    name.backgroundColor=[UIColor whiteColor];
    name.leftView=label1;
    name.leftViewMode=UITextFieldViewModeAlways;
    name.placeholder=@"请输入账户名";
    [self.view addSubview:name];
    
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    label2.text=@"新密码：";
    label2.textAlignment=NSTextAlignmentRight;
    newcode=[[UITextField alloc]init];
    newcode.leftView=label2;
    newcode.backgroundColor =[UIColor whiteColor];
    newcode.leftViewMode=UITextFieldViewModeAlways;
    newcode.placeholder=@"请输入新密码";
    [self.view addSubview:newcode];
    
    
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    label3.text=@"确认密码：";
    label3.textAlignment=NSTextAlignmentRight;
    requirecode=[[UITextField alloc]init];
    requirecode.leftView=label3;
    requirecode.leftViewMode=UITextFieldViewModeAlways;
    requirecode.backgroundColor=[UIColor whiteColor];
    requirecode.placeholder=@"请再次输入新密码";
    [self.view addSubview:requirecode];
    
    
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    label4.text=@"验证码：";
    label4.textAlignment=NSTextAlignmentRight;
    securitycode=[[UITextField alloc]init];
    securitycode.leftView=label4;
    securitycode.leftViewMode=UITextFieldViewModeAlways;
    securitycode.backgroundColor=[UIColor whiteColor];
    securitycode.placeholder=@"请输入验证码";
    [self.view addSubview:securitycode];
    
    
    
    //获取验证码按键
    UIButton *getsecuritycode=[UIButton buttonWithType:UIButtonTypeSystem];
    [getsecuritycode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getsecuritycode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getsecuritycode.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    getsecuritycode.backgroundColor=[UIColor greenColor];
    getsecuritycode.layer.cornerRadius=5;
    getsecuritycode.layer.masksToBounds=YES;
    [self.view addSubview:getsecuritycode];
    
  //确认修改密码按键
    UIButton *comfirmation=[UIButton buttonWithType:UIButtonTypeSystem];
    [comfirmation setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [comfirmation setTitle:@"确认修改" forState:UIControlStateNormal];
    comfirmation.backgroundColor=[UIColor orangeColor];
    comfirmation.layer.cornerRadius=8;
    comfirmation.layer.masksToBounds=YES;
    [self.view addSubview:comfirmation];
    
    
    
    
    name.sd_layout
    .topSpaceToView(self.view,15)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(50);
    
    
    newcode.sd_layout
    .topSpaceToView(name,15)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(50);
    
    
    requirecode.sd_layout
    .topSpaceToView(newcode,15)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(50);
    
    
    securitycode.sd_layout
    .topSpaceToView(requirecode,15)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(50);

    
    getsecuritycode.sd_layout
    .topSpaceToView(securitycode,-45)
    .bottomSpaceToView(securitycode,-45)
    .rightSpaceToView(self.view,10)
    .widthIs(85);
    
    comfirmation.sd_layout
    .topSpaceToView(securitycode,15)
    .rightSpaceToView(self.view,10)
    .leftSpaceToView(self.view,10)
    .heightIs(50);

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
