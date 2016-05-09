//
//  myordersViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/5.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "myordersViewController.h"
#import "shoppingcartModel.h"
#import "shoppingcartTableViewCell.h"
#import "UIView+SDAutoLayout.h"

typedef void(^Block) ();

@interface myordersViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
    //订单个数数组
    NSMutableArray *myorders;
    //订单详情数组
    NSMutableArray *shopingthings;
    //订单号数组
    NSMutableArray *ordernumber;
    Block  myblock;
    
}
@end

@implementation myordersViewController

-(void)creatData{
    
    NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:@"myorders"];
    NSArray *array=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    myorders=[[NSMutableArray alloc]initWithArray:array];
    NSArray *Array=[[NSUserDefaults standardUserDefaults]arrayForKey:@"ordernumber"];
    ordernumber=[NSMutableArray arrayWithArray:Array];
    
}

-(void)poptorootview{
    [self.tabBarController setSelectedIndex:4];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [myorders removeAllObjects];
    [shopingthings removeAllObjects];
    [ordernumber removeAllObjects];
    [self creatData];
    if(myorders.count<1){
        
    [self showMessage:@"暂无订单"];
    }
    
    
    [tableview reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.hidesBackButton =YES;
    self.navigationItem.title=@"我的订单";
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent=NO;
    
   //重写pop返回键具体点击事件,只跳回我的订单的rootview
    UIButton *leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame=CGRectMake(0, 0, 23, 30);
    [leftbutton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(poptorootview) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem=left;
    
    
    [self creatData];
    
    tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    tableview.dataSource=self;
    tableview.delegate=self;
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
   
    tableview.sd_layout
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0);
    
    
}
//我要退款按键
-(void)cancelorderClick{
    
    if(myblock){
        myblock();
    }
    
}


#pragma tableviewdatasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    shopingthings=[NSMutableArray arrayWithArray:myorders[section]];
    
    return  shopingthings.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return myorders.count;
}
//区头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    //获取订单号
    
    NSString *ordernumberStr=ordernumber[section];
    view.backgroundColor=[UIColor whiteColor];
    UILabel *label1=[[UILabel alloc]init];
    label1.text=[NSString stringWithFormat:@"订单号：%@",ordernumberStr];
    [view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]init];
    label2.textColor=[UIColor orangeColor];
    label2.text=@"待发货";
    label2.textAlignment=NSTextAlignmentRight;
    [view addSubview:label2];
    
    UILabel *labelline=[[UILabel alloc]init];
    labelline.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    [view addSubview:labelline];
    
    UILabel *labelline2=[[UILabel alloc]init];
    labelline2.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.90 alpha:1.00];
    [view addSubview:labelline2];
   
    
    
    
    
    labelline.sd_layout
    .topSpaceToView(view,0)
    .rightSpaceToView(view,0)
    .leftSpaceToView(view,0)
    .heightIs(10);
    
    
    label2.sd_layout
    .topSpaceToView(labelline,0)
    .rightSpaceToView(view,10)
    .widthIs(70)
    .heightIs(45);
    
    
    label1.sd_layout
    .topSpaceToView(labelline,0)
    .rightSpaceToView(label2,0)
    .leftSpaceToView(view,3)
    .heightIs(45);
    
    labelline2.sd_layout
    .topSpaceToView(label1,0)
    .rightSpaceToView(view,0)
    .leftSpaceToView(view,0)
    .heightIs(1);
    
    
    
    
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return (10+45);
}

//区尾
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    
  //计算订单总额
    NSInteger number=0;
    float price = 0.0;
    for(shoppingcartModel *model in shopingthings){
        
        number+=model.number;
        
        price=31.24*number;
        
    }
    NSString *string=[NSString stringWithFormat:@"订单总额：¥%0.2f",price];
    NSString *string1=[NSString stringWithFormat:@"¥%0.2f",price];
    NSMutableAttributedString *attributedstring=[[NSMutableAttributedString alloc]initWithString:string];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(5, [string1 length])];
    
    
    UILabel *labelline1=[[UILabel alloc]init];
    labelline1.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    [view addSubview:labelline1];

    //订单总额显示
    UILabel *label=[[UILabel alloc]init];
    label.attributedText=attributedstring;
    label.textAlignment=NSTextAlignmentRight;
    [view addSubview:label];
    
    UILabel *labelline2=[[UILabel alloc]init];
    labelline2.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    [view addSubview:labelline2];

    
    //我要退款按键
    
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"我要退款" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.00] forState:UIControlStateNormal];
    button1.titleLabel.font=[UIFont systemFontOfSize:14];
    button1.layer.borderColor=[UIColor grayColor].CGColor;
    button1.layer.borderWidth=1;
    [button1 addTarget:self action:@selector(cancelorderClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    
    //商家配货中
    
    UILabel *label2=[[UILabel alloc]init];
    label2.text=@"商家配货中";
    label2.textColor=[UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.00];
    label2.font=[UIFont systemFontOfSize:14];
    label2.textAlignment=NSTextAlignmentCenter;
    label2.layer.borderColor=[UIColor grayColor].CGColor;
    label2.layer.borderWidth=1;
    [view addSubview:label2];
    
    
    labelline1.sd_layout
    .topSpaceToView(view,0)
    .rightSpaceToView(view,0)
    .leftSpaceToView(view,0)
    .heightIs(1);
    
    
    label.sd_layout
    .topSpaceToView(labelline1,0)
    .leftSpaceToView(view,5)
    .rightSpaceToView(view,5)
    .heightIs(45);
    
    labelline2.sd_layout
    .topSpaceToView(label,0)
    .rightSpaceToView(view,0)
    .leftSpaceToView(view,0)
    .heightIs(1);
    
    button1.sd_layout
    .topSpaceToView(labelline2,5)
    .rightSpaceToView(view,5)
    .heightIs(30)
    .widthIs(70);
    
    label2.sd_layout
    .topEqualToView(button1)
    .rightSpaceToView(button1,5)
    .heightIs(30)
    .widthIs(90);
    
    
    
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  85;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *ID=@"cellconfirm";
    shopingthings=[NSMutableArray arrayWithArray:myorders[indexPath.section]];
    shoppingcartTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell)
    {
        cell=[[shoppingcartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.selectbutton.hidden=YES;
    cell.deletebutton.hidden=YES;
    cell.addnumbutton.hidden=YES;
    cell.cutnumbutton.hidden=YES;
    cell.numlabel.hidden=YES;
    
    
    //选择回调
    myblock=^(){
        NSLog(@"我要退款");
        
    NSArray *array=[NSArray arrayWithArray:myorders[indexPath.section]];
        
        [myorders removeObject:array];
        
       NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myorders];
      //删除该行
      [tableview deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];
        
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"myorders"];
        
       

        [ordernumber removeObject:ordernumber[indexPath.section]];
        NSArray *Array=[NSArray arrayWithArray:ordernumber];
        [[NSUserDefaults standardUserDefaults]setObject:Array forKey:@"ordernumber"];
         [tableview reloadData];
        
    };
       [cell loaddataWith:[shopingthings objectAtIndex:indexPath.row]];
    return cell;
    
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
    CGSize LabelSize=[message boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 999) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]} context:nil].size;
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:16];
    
    showview.frame = CGRectMake(20, ([UIScreen mainScreen].bounds.size.height)/2,[UIScreen mainScreen].bounds.size.width-40, LabelSize.height+10);
    label.frame = CGRectMake((CGRectGetMaxX(showview.frame)-LabelSize.width)/2, 5, LabelSize.width, LabelSize.height);
    
    [showview addSubview:label];
    [UIView animateWithDuration:2 animations:^{showview.alpha=0.0f;}    completion:^(BOOL finished) {
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
