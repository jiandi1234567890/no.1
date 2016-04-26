//
//  DescriptionsViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/5.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "DescriptionsViewController.h"
#import "shoppingcartViewController.h"
#import "confirmorderViewController.h"



#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height

@interface DescriptionsViewController ()
{
  UIButton *collectbutton;
  
}

@end

@implementation DescriptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"商品详情";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;
    
    UIButton *rightbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame=CGRectMake(0, 0, 30, 30);
    [rightbutton setImage:[UIImage imageNamed:@"navbar_cart.png"] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(Descriptionightbutton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbutton];
    
    self.navigationItem.rightBarButtonItem=right;
    
    
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-51-64, ScreenWidth, 1.5)];
    view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:view];
    
//首页按键
    UIButton *homebutton=[UIButton buttonWithType:UIButtonTypeCustom];
    homebutton.frame=CGRectMake(0, ScreenHeight-49-64, ScreenWidth/7, 49);
    [homebutton setImage:[UIImage imageNamed:@"tab_home_light.png"] forState:UIControlStateNormal];
    [homebutton setTitle:@"首页" forState:UIControlStateNormal];
    [homebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    homebutton.titleLabel.font = [UIFont systemFontOfSize:12];
    homebutton.titleEdgeInsets = UIEdgeInsetsMake(0, -homebutton.imageView.intrinsicContentSize.width,-homebutton.imageView.intrinsicContentSize.height, 0);
    homebutton.imageEdgeInsets=UIEdgeInsetsMake(-homebutton.titleLabel.intrinsicContentSize.height, 0,0,-homebutton.titleLabel.intrinsicContentSize.width);
    [homebutton addTarget:self  action:@selector(homebuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homebutton];
    
//收藏按键
    collectbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    collectbutton.frame=CGRectMake(ScreenWidth/7, ScreenHeight-49-64, ScreenWidth/7, 49);
    [collectbutton setImage:[UIImage imageNamed:@"icon_cont_sc.png"] forState:UIControlStateNormal];
    [collectbutton setTitle:@"收藏" forState:UIControlStateNormal];
    [collectbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    collectbutton.titleLabel.font=[UIFont systemFontOfSize:12];
    collectbutton.titleEdgeInsets=UIEdgeInsetsMake(0, -collectbutton.imageView.intrinsicContentSize.width, -collectbutton.imageView.intrinsicContentSize.height+3, 0);
    collectbutton.imageEdgeInsets=UIEdgeInsetsMake(-collectbutton.titleLabel.intrinsicContentSize.height-2, 0, 0, -collectbutton.titleLabel.intrinsicContentSize.width);
    [collectbutton addTarget:self action:@selector(collectbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectbutton];
    
    
    
  //客服按键
    UIButton *contactusbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    contactusbutton.frame=CGRectMake(ScreenWidth*2/7, ScreenHeight-49-64, ScreenWidth/7, 49);
    [contactusbutton setImage:[UIImage imageNamed:@"icon_cont_kh.png"] forState:UIControlStateNormal];
    [contactusbutton setTitle:@"客服" forState:UIControlStateNormal];
    [contactusbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    contactusbutton.titleLabel.font = [UIFont systemFontOfSize:12];
   contactusbutton.titleEdgeInsets = UIEdgeInsetsMake(0, -contactusbutton.imageView.intrinsicContentSize.width,-contactusbutton.imageView.intrinsicContentSize.height+3, 0);
    contactusbutton.imageEdgeInsets=UIEdgeInsetsMake(-contactusbutton.titleLabel.intrinsicContentSize.height, 0,0,-contactusbutton.titleLabel.intrinsicContentSize.width);
    [contactusbutton addTarget:self  action:@selector(contactusbuttonClick) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:contactusbutton];
    
    
    //加入购物车按键
    UIButton *putItinshoppingcart=[UIButton buttonWithType:UIButtonTypeCustom];
    putItinshoppingcart.frame=CGRectMake(ScreenWidth*3/7, ScreenHeight-49.5-64,(ScreenWidth-ScreenWidth*3/7)/2, 49.5);
    [putItinshoppingcart setTitle:@"加入购物车" forState:UIControlStateNormal];
    [putItinshoppingcart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    putItinshoppingcart.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    putItinshoppingcart.backgroundColor=[UIColor orangeColor];
    [putItinshoppingcart addTarget:self action:@selector(putItinshoppingcartClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:putItinshoppingcart];
    
    //立刻购买按键
    UIButton *buyitbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    buyitbutton.frame=CGRectMake(ScreenWidth*3/7+(ScreenWidth-ScreenWidth*3/7)/2, ScreenHeight-49.5-64,(ScreenWidth-ScreenWidth*3/7)/2, 49.5);
    [buyitbutton setTitle:@"立刻购买" forState:UIControlStateNormal];
    [buyitbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyitbutton.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    buyitbutton.backgroundColor=[UIColor redColor];
    
    [buyitbutton addTarget:self action:@selector(buyitbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buyitbutton];

    
    
}


//购物车按键
-(void)Descriptionightbutton
{
       shoppingcartViewController *spVC=[shoppingcartViewController new];
    spVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:spVC animated:YES];
    
}


//首页按键
-(void)homebuttonClick
{
    NSLog(@"首页按键");
    
    
    [self.tabBarController setSelectedIndex:0];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


//收藏按键
-(void)collectbuttonClick
{
   
    [self showMessage:@"收藏成功"];
    
    
}




//客服按键
-(void)contactusbuttonClick
{
    NSLog(@"客服按键");
    
    UIAlertController  *altc=[UIAlertController alertControllerWithTitle:@"" message:@"确定通过QQ联系客服么？" preferredStyle:UIAlertControllerStyleActionSheet];
    [altc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil] ];
    [altc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:altc animated:YES completion:nil];

    
    
   
}


//加入购物车按键
-(void)putItinshoppingcartClick

{
    
    
    NSInteger number=[[NSUserDefaults standardUserDefaults]integerForKey:@"addshoppingcart"];
    if(number){
        number+=1;
        [[NSUserDefaults standardUserDefaults]setInteger:number forKey:@"addshoppingcart"];
    }else{
        [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"addshoppingcart"];
    }

    [self showMessage:@"成功加入购物车"];
    
    
}



//立刻购买按键
-(void)buyitbuttonClick
{
    NSLog(@"立刻购买");
    
    NSInteger login=[[NSUserDefaults standardUserDefaults] integerForKey:@"login"];
    
    if(login==100){
    confirmorderViewController *confirmVC=[[confirmorderViewController alloc]init];
    confirmVC.hidesBottomBarWhenPushed=YES;
    
        [self.navigationController pushViewController:confirmVC animated:YES];
    }else{
        
        [self.tabBarController setSelectedIndex:4];
        [self.navigationController popToRootViewControllerAnimated:YES];

    }

}


//按键提醒显示
-(void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.alpha = 0.8f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize=[message boundingRectWithSize:CGSizeMake(ScreenWidth, 999) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]} context:nil].size;
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    
    showview.frame = CGRectMake(20, ScreenHeight/2,ScreenWidth-40, LabelSize.height+10);
    label.frame = CGRectMake((CGRectGetMaxX(showview.frame)-LabelSize.width)/2, 5, LabelSize.width, LabelSize.height);
    
    [showview addSubview:label];
    [UIView animateWithDuration:3 animations:^{showview.alpha=0.0f;}    completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
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
