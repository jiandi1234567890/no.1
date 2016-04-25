//
//  activityViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "activityViewController.h"
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface activityViewController ()<UIScrollViewDelegate>
{
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
}

@end

@implementation activityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    
    [self initscrollview];
    
    
    
}



-(void)initscrollview
{
    
    UIScrollView *mainscrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49)];
    mainscrollview.delegate=self;
    mainscrollview.backgroundColor=[UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.00];
    mainscrollview.contentSize=CGSizeMake(ScreenWidth, ScreenHeight-49);
    [self.view  addSubview:mainscrollview];
    
    
    button1=[UIButton buttonWithType:UIButtonTypeCustom];
   button1.frame= CGRectMake(0, 5, ScreenWidth, ScreenHeight/7);
   [button1 setImage:[UIImage imageNamed:@"pic_ad1.jpg"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollview addSubview:button1];
    
    button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame=CGRectMake(0, ScreenHeight/7+10, ScreenWidth, ScreenHeight/7);
    [button2 setImage:[UIImage imageNamed:@"pic_ad2.jpg"] forState:UIControlStateNormal];
     [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollview addSubview:button2];
    
    
    button3=[UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame=CGRectMake(0, ScreenHeight*2/7+15, ScreenWidth, ScreenHeight/5);
    [button3 setImage:[UIImage imageNamed:@"img_hd1.jpg"] forState:UIControlStateNormal];
     [button3 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollview addSubview:button3];

    button4=[UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame=CGRectMake(0, ScreenHeight*2/7+ScreenHeight/5+20, ScreenWidth, ScreenHeight/5);
    [button4 setImage:[UIImage imageNamed:@"img_hd2.jpg"] forState:UIControlStateNormal];
     [button4 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollview addSubview:button4];
    
    
    button5=[UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame=CGRectMake(0, ScreenHeight*2/7+ScreenHeight*2/5+25, ScreenWidth, ScreenHeight/5);
    [button5 setImage:[UIImage imageNamed:@"img_hd3.jpg"] forState:UIControlStateNormal];
     [button5 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollview addSubview:button5];
    

}

-(void)button1Click
{
//加载登陆界面
    NSLog(@"判断是否登录");
    [self.tabBarController setSelectedIndex:4];

}
-(void)button2Click
{

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.farmno1.com/"]];


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
