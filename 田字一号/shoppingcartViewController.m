//
//  shoppingcartViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "shoppingcartViewController.h"
#import "shoppingcartTableViewCell.h"
#import "shoppingcartModel.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "confirmorderViewController.h"

@interface shoppingcartViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
    NSArray *pricearray;
    NSInteger settlementnumber;
    float settlementprice;
    UIButton *allselectbutton;
    UILabel *settlementlabel;
    BOOL allselect;
    
    //选中的cell
    NSMutableArray *sellectarray;
    //展示用的模型数组
    NSMutableArray *dataarray;
    
}
@end

@implementation shoppingcartViewController

//计算个数及总价重新显示
-(void)reloadprice
{
    settlementprice=0;
    settlementnumber=0;
    
    for(shoppingcartModel *model in sellectarray){
        
        settlementnumber+=model.number;
        
        settlementprice=31.24*settlementnumber;
       
    }
    
    
    NSString *string=[NSString stringWithFormat:@"共%ld件，总金额¥%0.2f",(long)settlementnumber,settlementprice];
    NSString *string1=[NSString stringWithFormat:@"%ld",(long)settlementnumber];
    NSString *string2=[NSString stringWithFormat:@"%0.2f",settlementprice];
    NSMutableAttributedString *attributedstring=[[NSMutableAttributedString alloc]initWithString:string];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(1, [string1 length])];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange([string1 length]+6, [string2 length]+1)];
    settlementlabel.attributedText=attributedstring;

    
    
}


//展示模型
-(void)creatData {
  
    
    NSInteger number=[[NSUserDefaults standardUserDefaults]integerForKey:@"addshoppingcart"];
    for (int i = 0; i < number; i++) {
        shoppingcartModel *model = [[shoppingcartModel alloc]init];
        
        model.namestr = @"田字一号筒骨";
        model.number =1;
        //model.pricestr = [NSString stringWithFormat:@"¥ 23.00\nX %ld",(long)model.number];
        model.imagename =@"pic_tj1.jpg";
       
        
        [dataarray addObject:model];
        }
    
}



//结算按键
-(void)settlementbuttonClick{
    
    if(sellectarray.count>0){
    
    confirmorderViewController *confirmVC=[[confirmorderViewController alloc]init];
    confirmVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:confirmVC animated:YES];
      
        //结算选中的物品
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:sellectarray];
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"shoppingthings"];
        //购物车移除结算的商品
        NSInteger number=dataarray.count-sellectarray.count;
        [[NSUserDefaults standardUserDefaults]setInteger:number forKey:@"addshoppingcart"];
        
    }else{
        [self showMessage:@"还未选择商品，请勾选商品"];
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    //每次进入购物车都将选中状态取消
    allselect=NO;
    allselectbutton.selected=NO;
    [sellectarray removeAllObjects];
    
    
    
    [dataarray removeAllObjects];
    [self creatData];
    [tableview reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    allselect=NO;
    sellectarray=[[NSMutableArray alloc]init];
    
    dataarray= [[NSMutableArray alloc]init];
    
   
    
    
    
    self.view.backgroundColor=[UIColor grayColor];
    
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;
    self.tabBarController.tabBar.translucent=NO;
    
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    tableview=[[UITableView alloc]init];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableview.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    //self.tabBarItem.badgeValue=@"123";
    [self.view addSubview:tableview];
   
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];

    UILabel *graylabel=[[UILabel alloc]init];
    graylabel.backgroundColor=[UIColor grayColor];
    [view addSubview:graylabel ];
    
    
    
    allselectbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [allselectbutton setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    [allselectbutton setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [allselectbutton addTarget:self action:@selector(allselectbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:allselectbutton];
    
    
    UILabel *allselectlabel=[[UILabel alloc]init];
    allselectlabel.text=@"全选";
    allselectlabel.textColor=[UIColor greenColor];
    [view addSubview:allselectlabel];
  
    
    
    settlementlabel=[[UILabel alloc]init];
    NSString *string=[NSString stringWithFormat:@"共%ld件，总金额¥%0.2f",(long)settlementnumber,settlementprice];
       NSMutableAttributedString *attributedstring=[[NSMutableAttributedString alloc]initWithString:string];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(1, 1)];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(7, 5)];
    
    settlementlabel.attributedText=attributedstring;
    settlementlabel.font=[UIFont systemFontOfSize:13];
    settlementlabel.backgroundColor=[UIColor clearColor];
    settlementlabel.textAlignment=NSTextAlignmentRight;
    [view addSubview:settlementlabel];
    
    
    
    
    UIButton *settlementbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    settlementbutton.backgroundColor=[UIColor orangeColor];
    [settlementbutton setTitle:@"结算" forState:UIControlStateNormal];
    [settlementbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [settlementbutton addTarget:self action:@selector(settlementbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:settlementbutton];
    
    
    
  //控件约束
    tableview.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,45);
    
    view.sd_layout
    .topSpaceToView(tableview,0)
    .leftEqualToView(tableview)
    .rightEqualToView(tableview)
    .heightIs(45);
    
    graylabel.sd_layout
    .topEqualToView(tableview)
    .leftEqualToView(tableview)
    .rightEqualToView(tableview)
    .heightIs(1.5);
    
    //全选按钮
    allselectbutton.sd_layout
    .centerYEqualToView(view)
    .leftSpaceToView(view,10)
    .widthIs(20)
    .heightIs(20);
    
    //全选标签
    allselectlabel.sd_layout
    .leftSpaceToView(allselectbutton,10)
    .heightIs(45)
    .widthIs(34);
    
    
    //结算按钮
    settlementbutton.sd_layout
    .topSpaceToView(view,1.5)
    .rightEqualToView(view)
    .widthIs(60)
    .heightIs(45);
    
    //结算标签
    settlementlabel.sd_layout
    .topEqualToView(view)
    .rightSpaceToView(settlementbutton,10)
    .leftSpaceToView(allselectlabel,10)
    .heightIs(45);
    
    
     [self creatData];
     [tableview reloadData];
}


//全选按键

-(void)allselectbuttonClick:(UIButton *)button
{
    
    //点击全选时,把之前已选择的全部删除
    [sellectarray removeAllObjects];


    button.selected=!button.selected;
    allselect=button.selected;
    if(allselect){
        for(shoppingcartModel *model in dataarray){
            [sellectarray addObject:model];
        }
            
    }else{
        [sellectarray removeAllObjects];
      
    }
   
    
    [self reloadprice];
    [tableview reloadData];
    
   
   
}




#pragma mark tableviewdatasoure
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;

  }


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 1;
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSString *string=[NSString stringWithFormat:@"%ld",(long)dataarray.count];
    if([string isEqualToString:@"0"]){
        string=nil;
        
    }
    self.tabBarItem.badgeValue=string;
    
       return dataarray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view ;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    
    shoppingcartTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell)
    {
        cell=[[shoppingcartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.isSelected=allselect;
    
    
    
    
    
    if([sellectarray containsObject:[dataarray objectAtIndex:indexPath.section]]){
        cell.isSelected=YES;
    
    }
    
    
    //回调
    cell.cartBlock=^(BOOL select){
    
       
      
        if(select){
            [sellectarray addObject:[dataarray objectAtIndex:indexPath.section]];

        }else{
            [sellectarray removeObject:[dataarray objectAtIndex:indexPath.section]];
        }
        
        if(sellectarray.count==dataarray.count){
            allselectbutton.selected=YES;
        }else{
            allselectbutton.selected=NO;
        }
        allselect=allselectbutton.selected;
        [self reloadprice];
    };
    __block shoppingcartTableViewCell *weakcell=cell;
    cell.addnumber=^(){
        
        
        
       NSInteger count=[weakcell.numlabel.text integerValue];
       count++;
        
        shoppingcartModel *model=[dataarray objectAtIndex:indexPath.section];
         model.number=count;
        NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
        
        NSString *priceStr=[NSString stringWithFormat:@"¥ 23.00\nX %ld",(long)count];
        weakcell.numlabel.text=numStr;
        weakcell.pricelabel.text=priceStr;
        
        [dataarray replaceObjectAtIndex:indexPath.section withObject:model];
        
        
        if([sellectarray containsObject:model]){
            [sellectarray removeObject:model];
            [sellectarray addObject:model];
            [self reloadprice];
        }
        
    };
    
    cell.cutnumber=^(){
       
      NSInteger  count=[weakcell.numlabel.text integerValue];
        count--;
        if(count<1){
            count=1;
        }
        
        
       shoppingcartModel *model=[dataarray objectAtIndex:indexPath.section];
        model.number=count;
        [dataarray replaceObjectAtIndex:indexPath.section withObject:model];
        NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
        
        NSString *priceStr=[NSString stringWithFormat:@"¥ 23.00\nX %ld",(long)count];
        weakcell.numlabel.text=numStr;
        weakcell.pricelabel.text=priceStr;
        if([sellectarray containsObject:model]){
            [sellectarray removeObject:model];
            [sellectarray addObject:model];
            [self reloadprice];
        }

        
    };
    
    //删除cell
    
    cell.deletecell=^{
        
        
        
        shoppingcartModel *model = [dataarray objectAtIndex:indexPath.section];
        
        [dataarray removeObjectAtIndex:indexPath.section];
        
        //删除
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
   
        [tableview deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];

        //NSInteger number=dataarray.count;
        
            [[NSUserDefaults standardUserDefaults] setInteger:dataarray.count forKey:@"addshoppingcart"];
       
        //判断是否选择
        if ([sellectarray containsObject:model]) {
            //从已选中删除,重新计算价格
            [sellectarray removeObject:model];
             [self reloadprice];
        }
        
        
        //全选按键在删除一些cell后的状态
        if (sellectarray.count == dataarray.count) {
            allselectbutton.selected = YES;
        } else {
            allselectbutton.selected = NO;
        }
        
        if(dataarray.count<1){
            allselectbutton.selected=NO;
        }
        
        [tableview reloadData];
    };
    
     [cell loaddataWith:[dataarray objectAtIndex:indexPath.section]];
    
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
    label.font = [UIFont boldSystemFontOfSize:18];
    
    showview.frame = CGRectMake(20, ([UIScreen mainScreen].bounds.size.height)/2,[UIScreen mainScreen].bounds.size.width-40, LabelSize.height+10);
    label.frame = CGRectMake((CGRectGetMaxX(showview.frame)-LabelSize.width)/2, 5, LabelSize.width, LabelSize.height);
    
    [showview addSubview:label];
    [UIView animateWithDuration:2.5 animations:^{showview.alpha=0.0f;}    completion:^(BOOL finished) {
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
