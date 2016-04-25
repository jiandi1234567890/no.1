//
//  ViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "ViewController.h"
#import "homepageViewController.h"
#import "activityViewController.h"
#import "sortViewController.h"
#import "shoppingcartViewController.h"
#import "customercenterViewController.h"

@interface ViewController ()
{

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self buildingmainscreen];
    
}

//构建主界面
-(void)buildingmainscreen
{
    
    //首页
    homepageViewController *hpVC=[[homepageViewController alloc]init];
    UINavigationController  *hpNVC=[[UINavigationController alloc]initWithRootViewController:hpVC];
    //hpVC.navigationItem.title=@"首页";
    hpVC.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    
    hpVC.tabBarItem.title=@"首页";
    hpVC.tabBarItem.image=[UIImage imageNamed:@"tab_home_light.png"];
    hpVC.tabBarController.tabBar.tag=101;
    
    //活动
    activityViewController *atvVC=[[activityViewController alloc]init];
    UINavigationController *atvNVC=[[UINavigationController alloc] initWithRootViewController:atvVC];
    //两种方法更改navigationtitle的颜色
    //1、更改子视图title颜色
    atvVC.navigationItem.title=@"活动";
    [atvVC.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
//    //2、自定义navagationitem title的格式（该方法改字体比较容易实现）
//    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.font=[UIFont boldSystemFontOfSize:18];
//    atvVC.navigationItem.titleView=label;
//    label.text=@"活动";
//    [label sizeToFit];
    atvVC.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    atvVC.tabBarItem.title=@"活动";
    atvVC.tabBarItem.image=[UIImage imageNamed:@"tab_meassage_light.png"];
    
    
    //分类
    sortViewController *sortVC=[[sortViewController alloc]init];
    UINavigationController *sortNVC=[[UINavigationController alloc] initWithRootViewController:sortVC];
    //更改子视图title颜色
    [sortVC.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    sortVC.navigationItem.title=@"商品分类";
    sortVC.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    sortVC.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    sortVC.tabBarItem.title=@"商品分类";
    sortVC.tabBarItem.image=[UIImage imageNamed:@"tab_sort_light.png"];
    
    //购物车
    shoppingcartViewController *scVC=[[shoppingcartViewController alloc]init];
    UINavigationController *scNVC=[[UINavigationController alloc]initWithRootViewController:scVC];
    scVC.navigationItem.title=@"购物车";
    [scVC.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];

        scVC.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    scVC.tabBarItem.title=@"购物车";
    scVC.tabBarItem.image=[UIImage imageNamed:@"tab_cart_light.png"];
    
    //个人中心
    
    customercenterViewController *csVC=[[customercenterViewController alloc]init];
    UINavigationController *csNVC=[[UINavigationController alloc]initWithRootViewController:csVC];
   // csVC.navigationItem.title=@"个人中心";
    [csVC.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];

        csVC.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    csVC.tabBarItem.title=@"个人中心";
    csVC.tabBarItem.image=[UIImage imageNamed:@"tab_my_light.png"];
    csNVC.tabBarController.tabBar.tag=104;
    
    
    UITabBarController * tabBar = [[UITabBarController alloc] init];
    [tabBar.tabBar setBarTintColor:[UIColor whiteColor]];
    [tabBar.tabBar setTintColor:[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00]];
    tabBar.viewControllers=@[hpNVC,atvNVC,sortNVC,scNVC,csNVC];
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController=tabBar;
    
    

    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
