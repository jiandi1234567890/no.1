//
//  myordersViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/5.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "myordersViewController.h"

@interface myordersViewController ()

@end

@implementation myordersViewController


-(void)poptorootview{
    [self.tabBarController setSelectedIndex:4];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.hidesBackButton =YES;
    self.navigationItem.title=@"我的订单";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIButton *leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame=CGRectMake(0, 0, 23, 30);
    [leftbutton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(poptorootview) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    self.navigationItem.leftBarButtonItem=left;
    
    
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
