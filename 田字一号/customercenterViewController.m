//
//  customercenterViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "customercenterViewController.h"
#import "customer1TableViewCell.h"
#import "customer2TableViewCell.h"
#import "customer3TableViewCell.h"
#import "signoutTableViewCell.h"
#import "titleTableViewCell.h"
#import "messageViewController.h"
#import "registerViewController.h"
#import "findcodeViewController.h"
#import "addressViewController.h"
#import "shareViewController.h"
#import "helpViewController.h"
#import "myordersViewController.h"
#import "changecodeViewController.h"
#import "mymoneyViewController.h"
#import "mycollectionViewController.h"
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface customercenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITextField *phonenumberTF;
    UITextField *codeTF;
    UITableView *tableview;
    NSArray *firstlabelArray;
    NSArray *secondlabelArray;
    NSArray *imageArray;
    UIButton *registerbutton;
    UIButton *findcodebutton;
}
@end

@implementation customercenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _login=[[NSUserDefaults standardUserDefaults] integerForKey:@"login"];
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;
    self.tabBarController.tabBar.translucent=NO;
    
    
    firstlabelArray=@[@0,@"我的订单",@0,@"我的资产",@0,@"收货地址",@"密码修改",@"邀请人",@"帮助中心",@"关于我们",@0];
    secondlabelArray=@[@0,@"查看全部订单",@0,@"查看余额明细",@0,@"自提点、收货地址管理",@"密码修改、重置",@"邀请获积分",@"操作事项",@"了解田字一号",@0];
    imageArray=@[@0,@"user_wddd.png",@"",@"user_wdzc.png",@"",@"user_shdz.png",@"user_mmxg.png",@"user_yqr.png",@"user_bzzx.png",@"user_gywm.png",@0];
    
    
    if(_login==100){
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"会员中心";
        
        
        //更改返回键样式
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = item;

        
        //tableviewcell初始化
        tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-90) style:UITableViewStylePlain];
        tableview.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
        //隐藏分割线
        tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        tableview.delegate=self;
        tableview.dataSource=self;
        
        //tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self.view addSubview:tableview];
        
        
    }
    else{
        
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"登录";
        
        
        UILabel *nillabel1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 1)];
        nillabel1.backgroundColor=[UIColor clearColor];
        phonenumberTF=[[UITextField alloc]initWithFrame:CGRectMake(10, 20,ScreenWidth-20 , 40 )];
        phonenumberTF.layer.borderWidth=1.5;
        phonenumberTF.placeholder=@"请输入账号（手机或邮箱）";
        phonenumberTF.layer.cornerRadius=5;
        phonenumberTF.layer.masksToBounds=YES;
        phonenumberTF.leftView=nillabel1;
        phonenumberTF.leftViewMode=UITextFieldViewModeAlways;
        
        
        
        UILabel *nillabel2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 1)];
        nillabel2.backgroundColor=[UIColor clearColor];
        codeTF=[[UITextField alloc]initWithFrame:CGRectMake(10, 70, ScreenWidth-20 , 40 )];
        codeTF.layer.borderWidth=1.5;
        codeTF.placeholder=@"请输入密码 ";
        codeTF.layer.cornerRadius=5;
        codeTF.layer.masksToBounds=YES;
        codeTF.secureTextEntry=YES;
        codeTF.leftView=nillabel2;
        codeTF.leftViewMode=UITextFieldViewModeAlways;
        
        [self.view addSubview:phonenumberTF];
        [self.view addSubview:codeTF];
        
        UIButton *loginbutton=[UIButton buttonWithType:UIButtonTypeSystem];
        loginbutton.frame=CGRectMake(10, 120, ScreenWidth-20, 40);
        [loginbutton setTitle:@"确定登录" forState:UIControlStateNormal];
        [loginbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        loginbutton.backgroundColor=[UIColor orangeColor];
        loginbutton.titleLabel.font=[UIFont systemFontOfSize:16];
        loginbutton.layer.cornerRadius=6;
        loginbutton.layer.masksToBounds=YES;
        [loginbutton addTarget:self action:@selector(loginbuttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginbutton];
        
        //没账号马上注册按键
        NSString *string1=@"还没账号，马上注册";
        NSString *string2=@"忘记密码？";
       //获取字符串长度
        CGSize button1size=[string1 boundingRectWithSize:CGSizeMake(1000, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
         CGSize button2size=[string2  boundingRectWithSize:CGSizeMake(1000, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
        
        
        registerbutton=[UIButton buttonWithType:UIButtonTypeCustom];
        registerbutton.frame=CGRectMake(10, 160+10, button1size.width, button1size.height);
        registerbutton.titleLabel.font=[UIFont systemFontOfSize:13];

        //按键点中添加下滑线
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"还没账号，马上注册" ];
        NSMutableAttributedString *str1 =[[NSMutableAttributedString alloc] initWithString:@"还没账号，马上注册" ];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        //给文字添加颜色
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:strRange];
        [str1 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:strRange];
        [registerbutton setAttributedTitle:str forState:UIControlStateHighlighted];
        [registerbutton setAttributedTitle:str1 forState:UIControlStateNormal];
        [registerbutton addTarget:self action:@selector(registerbuttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:registerbutton];
        
        
        
        
        
        findcodebutton=[UIButton buttonWithType:UIButtonTypeCustom];
        findcodebutton.frame=CGRectMake(ScreenWidth-button2size.width-13, 160+10, button2size.width, button2size.height);
        NSMutableAttributedString *str2=[[NSMutableAttributedString alloc] initWithString:@"忘记密码？"];
        NSMutableAttributedString *str3 =[[NSMutableAttributedString alloc] initWithString:@"忘记密码？"];
        NSRange strRange1 = {0,[str2 length]};
        [str2 addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange1];
        [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:strRange1];
        [str3 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:strRange1];
        [findcodebutton setAttributedTitle:str2 forState:UIControlStateHighlighted];
        [findcodebutton setAttributedTitle:str3 forState:UIControlStateNormal];
        findcodebutton.titleLabel.font=[UIFont systemFontOfSize:13];
        [findcodebutton addTarget:self action:@selector(findcodebuttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:findcodebutton];
        
    }
    
    
}


//马上注册按键!
-(void)registerbuttonClick
{
    
    registerViewController *registerVC=[[registerViewController alloc]init];
    registerVC.hidesBottomBarWhenPushed=YES;
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
   
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
}

//找回密码按键
-(void)findcodebuttonClick
{
    
   
    
    findcodeViewController *findcodeVC=[[findcodeViewController alloc]init];
    findcodeVC.hidesBottomBarWhenPushed=YES;
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [self.navigationController pushViewController:findcodeVC animated:YES];
    

    
    
}


//登录按键
-(void)loginbuttonClick
{
    if(codeTF.text.length>0&&phonenumberTF.text.length>0)
    {
        if([codeTF.text isEqualToString:@"1"]&&[phonenumberTF.text isEqualToString:@"2"])
            
        {
            [[NSUserDefaults standardUserDefaults] setInteger:100  forKey:@"login"];
            //删除子视图 保留父视图
            [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
            [self viewDidLoad];
            
        }
        else
        {
            
            [[NSUserDefaults standardUserDefaults] setInteger:99  forKey:@"login"];
            UIAlertController  *altc=[UIAlertController alertControllerWithTitle:@"对不起" message:@"您输入的账户或密码错误" preferredStyle:UIAlertControllerStyleAlert];
            [altc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil] ];
            [altc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:altc animated:YES completion:nil];
            
        }
        
        
        
        
    }else
        
        
    {
        [[NSUserDefaults standardUserDefaults] setInteger:99  forKey:@"login"];
        UIAlertController  *altc=[UIAlertController alertControllerWithTitle:@"错误" message:@"输入的账户和密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        
        [altc addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil] ];
        
        [self presentViewController:altc animated:YES completion:nil];
        
        
    }
    
    
    codeTF.text=@"";
    phonenumberTF.text=@"";
    
    
    
}






-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}





#pragma mark tableviewdatasoure
//表格区头
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    return 0;
//}


//cell  高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
        return 160;
    else if(indexPath.section==2)
        return 60;
    else if(indexPath.section==4)
        return 98;
    else if(indexPath.section==10)
        return 40;
    else
        
        return 44;
}
//每个section的间隔
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==2||section==4||section==8||section==0)
        return 8;
    else if(section==9)
        return 20;
    else if(section==10)
        return 40;
    else
        return 0;
}

//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return firstlabelArray.count;
}

//行数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //   if(section==1)
    //    return 5;
    //    else
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID=@"cell1";
    if(indexPath.section==0)
    {
        titleTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        
        if(!cell)
        {
            cell=[[titleTableViewCell alloc]init];
        }
        
        //取消cell选中状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.namelabel.text=@"123456789";
        [cell.imagebutton addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button1 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button2 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button3 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        cell.label1.text=@"3";
        cell.label2.text=@"2";
        cell.label3.text=@"1";
        
        return cell;
        
    }
    else if(indexPath.section==2){
        customer2TableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        
        if(!cell)
        {
            cell=[[customer2TableViewCell alloc]init];
        }
        
        [cell.button1 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button2 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button3 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button4 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button5 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
       
        //取消cell选中状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else if(indexPath.section==4){
        
        
        customer3TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        
        if(!cell)
        {
            cell=[[customer3TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [cell.button1 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button2 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button3 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button4 addTarget:self action:@selector(chosebutton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //取消cell选中状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else if(indexPath.section==10){
        
       
        
        signoutTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        
        if(!cell)
        {
            cell=[[signoutTableViewCell alloc]init];
        }
        //取消cell选中状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor=[UIColor clearColor];
        return cell;
    }
    else
        
    {
        customer1TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!cell)
        {
            cell=[[customer1TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        //取消cell选中状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.imageView1.image=[UIImage imageNamed:imageArray[indexPath.section]];
        cell.firstlabel.text=firstlabelArray[indexPath.section];
        cell.secondlabel.text=secondlabelArray[indexPath.section];
        return cell;
        
    }
    
    
    
}



#pragma mark tableview delegate




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
           ;
            break;
        case 1://我的订单
        {NSLog(@"我的订单");
        
            myordersViewController *myorder=[[myordersViewController alloc]init];
            myorder.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myorder animated:YES];
        
        }
            break;
        case 2:
            ;
            break;
        case 3:
        {
            NSLog(@"我的资产");
            mymoneyViewController *myVC=[[mymoneyViewController alloc]init];
            myVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myVC animated:YES];
        
        }
            break;
        case 4:
            ;
            break;
        case 5:
        { NSLog(@"收货地址");
            
            addressViewController *addressVC=[addressViewController new];
            addressVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:addressVC animated:YES];
            
        }
            break;
        case 6:
        {
            NSLog(@"密码修改");
            changecodeViewController *changecodeVC=[[changecodeViewController alloc]init];
            changecodeVC.hidesBottomBarWhenPushed=YES;
            
           
            [self.navigationController pushViewController:changecodeVC animated:YES];
        
        }
            break;
        case 7:
        { NSLog(@"邀请人");
            
            shareViewController *sharevc=[[shareViewController alloc]init];
            sharevc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:sharevc animated:YES];
            
        }
            break;
        case 8:
        { NSLog(@"帮助中心");
            helpViewController *helpVC=[[helpViewController alloc]init];
            helpVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:helpVC animated:YES];
            
            
        }
            break;
        case 9:
        {
             NSLog(@"关于我们");
            
            
            messageViewController *mVC=[[messageViewController alloc]init];
            //隐藏tabbar
            mVC.hidesBottomBarWhenPushed = YES;
            //更改返回键样式
            [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:mVC animated:YES];

        }
            break;
        case 10://退出按键
        {
            [[NSUserDefaults standardUserDefaults] setInteger:99  forKey:@"login"];
            //删除子视图 保留父视图
            [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
            [self viewDidLoad];

        }
            break;
    default:
            break;
    }
}


-(void)chosebutton:(UIButton *)button
{
    
    switch (button.tag) {
        case 201:{
            NSLog(@"待配货");
            myordersViewController *myorder=[[myordersViewController alloc]init];
            myorder.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myorder animated:YES];

            
            
        }
            break;
    case 202:
        {
            NSLog(@"待自提");
            myordersViewController *myorder=[[myordersViewController alloc]init];
            myorder.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myorder animated:YES];

        }
            break;
        case 203:
        {
            NSLog(@"待收货");
            myordersViewController *myorder=[[myordersViewController alloc]init];
            myorder.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myorder animated:YES];

        }
            break;
        case 204:
        {
            NSLog(@"待评价");
            myordersViewController *myorder=[[myordersViewController alloc]init];
            myorder.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myorder animated:YES];

        }
            break;
        case 205:
        {
            NSLog(@"退款/售后");
            myordersViewController *myorder=[[myordersViewController alloc]init];
            myorder.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:myorder animated:YES];

        }
            break;
        case 206://section 0 聊天样式按键
        {
            NSLog(@"聊天样式按钮");
            messageViewController *mVC=[[messageViewController alloc]init];
            //隐藏tabbar
            mVC.hidesBottomBarWhenPushed = YES;
            //更改返回键样式
            [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:mVC animated:YES];
    
        }
            break;
        case 211:
            NSLog(@"优惠券");
            break;
        case 212:
            NSLog(@"积分");
            break;
        case 213:
            NSLog(@"余额");
            break;
        case 214:
            NSLog(@"充值");
            break;
        case 231:
        {
            NSLog(@"section 0 商品收藏");
            mycollectionViewController *collectionVC=[[mycollectionViewController alloc]init];
            collectionVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:collectionVC animated:YES];
        
        }
            break;
        case 232:
            NSLog(@"section 0 优惠券");
            break;
        case 233:
            NSLog(@"section 0 我的积分");
            break;
        default:
            break;
    }
    
    
    
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
