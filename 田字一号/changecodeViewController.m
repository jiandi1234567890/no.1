//
//  changecodeViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/30.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "changecodeViewController.h"
#import "findcodeViewController.h"
#import "UIView+SDAutoLayout.h"


@interface changecodeViewController ()

@end

@implementation changecodeViewController

//登陆密码修改
-(void)button1Click
{
    
}

//支付密码修改
-(void)button2Click
{
   findcodeViewController *findVC=[[findcodeViewController alloc]init];
    [self.navigationController pushViewController:findVC animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"密码修改";
    self.view.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    
    //登录密码
    UILabel *labelline1=[[UILabel alloc]init];
    labelline1.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labelline1];
    
    UIView *view1=[[UIView alloc]init];
    view1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view1];
    
    
    UILabel *label1=[[UILabel alloc]init];
    label1.text=@"登录密码";
    label1.textAlignment=NSTextAlignmentLeft;
    [view1 addSubview:label1];
    
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"密码修改、重置" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"icon_zcright.png"] forState:UIControlStateNormal];
    button1.imageEdgeInsets=UIEdgeInsetsMake(10, button1.titleLabel.intrinsicContentSize.width+10, 10, -button1.titleLabel.intrinsicContentSize.width-10);
    button1.titleEdgeInsets=UIEdgeInsetsMake(0, -button1.imageView.intrinsicContentSize.width, 0, button1.imageView.intrinsicContentSize.width);
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside ];
    [view1 addSubview:button1];
    
    
    
    //支付密码
    UILabel *labelline2=[[UILabel alloc]init];
    labelline2.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labelline2];
    
    UIView *view2=[[UIView alloc]init];
    view2.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view2];
    
    
    UILabel *label2=[[UILabel alloc]init];
    label2.text=@"支付密码";
    label2.textAlignment=NSTextAlignmentLeft;
    [view2 addSubview:label2];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"密码修改、重置" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"icon_zcright.png"] forState:UIControlStateNormal];
    button2.imageEdgeInsets=UIEdgeInsetsMake(10, button2.titleLabel.intrinsicContentSize.width+10, 10, -button2.titleLabel.intrinsicContentSize.width-10);
    button2.titleEdgeInsets=UIEdgeInsetsMake(0, -button2.imageView.intrinsicContentSize.width, 0, button2.imageView.intrinsicContentSize.width);
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:button2];

    
    UILabel *labelline3=[[UILabel alloc]init];
    labelline3.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labelline3];
    
    labelline1.sd_layout
    .topSpaceToView(self.view,15)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(1);
    
    
    view1.sd_layout
    .topSpaceToView(labelline1,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(60);

    label1.sd_layout
    .topSpaceToView(view1,0)
    .bottomSpaceToView(view1,0)
    .leftSpaceToView(view1,10)
    .widthIs(80);
    
    button1.sd_layout
    .topSpaceToView(view1,10)
    .bottomSpaceToView(view1,10)
    .rightSpaceToView(view1,10)
    .widthIs(160);
    
    
    
    labelline2.sd_layout
    .topSpaceToView(view1,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(1);
    
    
    view2.sd_layout
    .topSpaceToView(labelline2,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(60);
    
    label2.sd_layout
    .topSpaceToView(view2,0)
    .bottomSpaceToView(view2,0)
    .leftSpaceToView(view2,10)
    .widthIs(80);
    
    button2.sd_layout
    .topSpaceToView(view2,10)
    .bottomSpaceToView(view2,10)
    .rightSpaceToView(view2,10)
    .widthIs(160);
    
   labelline3.sd_layout
    .topSpaceToView(view2,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(1);
    
    
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
