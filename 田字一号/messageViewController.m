//
//  messageViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/29.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "messageViewController.h"

@interface messageViewController ()

@end

@implementation messageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"信息内容";
    self.view.backgroundColor=[UIColor whiteColor];
   
    
    
   
    UILabel *messagelabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width,20)];
    messagelabel.backgroundColor=[UIColor whiteColor];
    messagelabel.text=@"关于我们介绍。。。。。。。。";
    messagelabel.font=[UIFont systemFontOfSize:15];
    messagelabel.textAlignment=NSTextAlignmentLeft;
   
    [self.view addSubview:messagelabel];
    
    
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
