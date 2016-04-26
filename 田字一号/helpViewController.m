//
//  helpViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/26.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "helpViewController.h"
#import "UIView+SDAutoLayout.h"

@interface helpViewController ()

@end

@implementation helpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title=@"帮助中心";
    self.view.backgroundColor=[UIColor whiteColor];
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;

    UILabel *label=[[UILabel alloc]init];
    label.text=@"帮助中心文档。。。。";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
    label.sd_layout
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0);
    
    
    
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
