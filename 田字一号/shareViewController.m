//
//  shareViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/5.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "shareViewController.h"

@interface shareViewController ()

@end

@implementation shareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent=NO;
    self.navigationItem.title=@"邀请好友";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIImageView  *headimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    headimageview.image=[UIImage imageNamed:@"Screenshot_2016-04-13-13-22-14_com.gnwai.ruralone_1460524968849.jpg"];
    
    [self.view addSubview:headimageview];
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
