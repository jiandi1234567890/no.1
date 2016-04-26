//
//  confirmorderViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/26.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "confirmorderViewController.h"
#import "UIView+SDAutoLayout.h"

@interface confirmorderViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation confirmorderViewController




-(void)SubmitOrdersbuttonClick{
    
    NSLog(@"提交订单");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;
    
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    self.navigationItem.title=@"确认订单";
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *labelline=[[UILabel alloc]init];
    labelline.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labelline];
    
    UIButton *SubmitOrdersbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    SubmitOrdersbutton.backgroundColor=[UIColor orangeColor];
    [SubmitOrdersbutton setTitle:@"提交订单" forState:UIControlStateNormal];
    [SubmitOrdersbutton addTarget:self action:@selector(SubmitOrdersbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SubmitOrdersbutton];
    
    UITableView *tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    
    
    [self.view addSubview:tableview];
    
    
    labelline.sd_layout
    .bottomSpaceToView(self.view,55)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(1);
    
    SubmitOrdersbutton.sd_layout
    .topSpaceToView(labelline,0)
    .bottomSpaceToView(self.view,0)
    .rightEqualToView(labelline)
    .widthIs(100);
    
    
    tableview.sd_layout
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(labelline,0);
    
    
}


#pragma mark tableviewdatasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//    
//    
//}



#pragma mark tableviewdelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
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
