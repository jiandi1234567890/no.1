//
//  findcodeViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/12.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "findcodeViewController.h"

@interface findcodeViewController ()

@end

@implementation findcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.navigationItem.title=@"找回密码";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    

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
