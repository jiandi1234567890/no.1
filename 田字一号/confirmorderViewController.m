//
//  confirmorderViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/26.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "confirmorderViewController.h"
#import "UIView+SDAutoLayout.h"
#import "shoppingcartModel.h"
#import "addressModel.h"
#import "addressViewController.h"
#import "shoppingcartTableViewCell.h"
#import "addressTableViewCell.h"
#import "ordersettlementTableViewCell.h"


@interface confirmorderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *tableview;
    //底栏的详情
    UILabel *settlementlabel;
    //购物项目
    NSMutableArray *shoppingthingsArray;
    //地址
    NSArray *addressArray;
    //商品的件数
    NSString *number;
    
    //商品的总价
    NSString *allmoney;
    
    
}
@end

@implementation confirmorderViewController

-(void)creatData{
    
    NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:@"shoppingthings"];
    if(data){
        shoppingthingsArray=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        number=[NSString stringWithFormat:@"%ld",shoppingthingsArray.count];
    }
    NSData *dataAddress=[[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
    if(dataAddress){
        addressArray=[NSKeyedUnarchiver unarchiveObjectWithData:dataAddress];
       // addressArray =[NSArray arrayWithObjects:mutablearray[0], nil];
    }
    
    
}

-(void)reloadPrice{
    NSInteger settlementnumber=0;
    float settlementprice = 0.00;
    for(shoppingcartModel *model in shoppingthingsArray){
        
        settlementnumber+=model.number;
        
        settlementprice=23*settlementnumber;
       
    }
    
    allmoney=[NSString stringWithFormat:@"%0.2f",settlementprice];
    NSString *string=[NSString stringWithFormat:@"共%@件，总金额¥%@",number,allmoney];
    NSString *string1=[NSString stringWithFormat:@"%@",number];
    NSString *string2=[NSString stringWithFormat:@"%@",allmoney];
    NSMutableAttributedString *attributedstring=[[NSMutableAttributedString alloc]initWithString:string];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(1, [string1 length])];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange([string1 length]+6, [string2 length]+1)];
    settlementlabel.attributedText=attributedstring;
    
}

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
    
    [self creatData];
    [self reloadPrice];
    
    UILabel *labelline=[[UILabel alloc]init];
    labelline.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labelline];
    
    UIButton *SubmitOrdersbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    SubmitOrdersbutton.backgroundColor=[UIColor orangeColor];
    [SubmitOrdersbutton setTitle:@"提交订单" forState:UIControlStateNormal];
    [SubmitOrdersbutton addTarget:self action:@selector(SubmitOrdersbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SubmitOrdersbutton];
    
    
    settlementlabel=[[UILabel alloc]init];
    NSString *string=[NSString stringWithFormat:@"共%@件，总金额¥%@",number,allmoney];
    NSString *string1=[NSString stringWithFormat:@"%@",number];
    NSString *string2=[NSString stringWithFormat:@"%@",allmoney];
    NSMutableAttributedString *attributedstring=[[NSMutableAttributedString alloc]initWithString:string];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(1, [string1 length])];
    [attributedstring addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange([string1 length]+6, [string2 length]+1)];
    settlementlabel.attributedText=attributedstring;
    settlementlabel.font=[UIFont systemFontOfSize:15];
    settlementlabel.backgroundColor=[UIColor clearColor];
    settlementlabel.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:settlementlabel];

    
    
    
    tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    tableview.delegate=self;
    tableview.dataSource=self;
    
    //解决默认cell下划线偏移问题
    if ([tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableview   setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableview  respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableview  setLayoutMargins:UIEdgeInsetsZero];
    }
    
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
    
    settlementlabel.sd_layout
    .topEqualToView(SubmitOrdersbutton)
    .bottomSpaceToView(self.view,0)
    .leftSpaceToView(self.view,5)
    .rightSpaceToView(SubmitOrdersbutton,10);
    
    tableview.sd_layout
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(labelline,0);
    
    
}


#pragma mark tableviewdatasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section==0){
        return 54;
    }
    else if(indexPath.section==1){
    return 95;
    }else if(indexPath.section==2){
        return (170+180);
    }
    else {return 0;}
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==1){
       return shoppingthingsArray.count;
    }else {
        return 1;
    }
    
   }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   // return 6;
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        
        static NSString *ID1=@"celladdress";
        addressTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID1];
        if(!cell){
            cell=[[addressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID1];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
      
        [cell loadDataWithModel:addressArray[0]];
        //解决默认cell下划线偏移问题
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }

        return cell;
        
    }else if(indexPath.section==1){
    static NSString *ID=@"cellconfirm";
    
    shoppingcartTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell)
    {
        cell=[[shoppingcartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.selectbutton.hidden=YES;
    cell.deletebutton.hidden=YES;
   
        
        //解决默认cell下划线偏移问题
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        
 //回调
    __block shoppingcartTableViewCell *weakcell=cell;
    cell.addnumber=^(){
        
        NSInteger count=[weakcell.numlabel.text integerValue];
        count++;
        
        shoppingcartModel *model=[shoppingthingsArray objectAtIndex:indexPath.row];
        model.number=count;
        NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
        
        NSString *priceStr=[NSString stringWithFormat:@"¥ 23.00\nX %ld",(long)count];
        weakcell.numlabel.text=numStr;
        weakcell.pricelabel.text=priceStr;
        
        [shoppingthingsArray replaceObjectAtIndex:indexPath.row withObject:model];
        
       [self reloadPrice];
        [tableview reloadData];
        
        
    };
    
    cell.cutnumber=^(){
        
        NSInteger  count=[weakcell.numlabel.text integerValue];
        count--;
        if(count<1){
            count=1;
        }
        
        
        shoppingcartModel *model=[shoppingthingsArray objectAtIndex:indexPath.row];
        model.number=count;
        [shoppingthingsArray replaceObjectAtIndex:indexPath.row withObject:model];
        NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
        
        NSString *priceStr=[NSString stringWithFormat:@"¥ 23.00\nX %ld",(long)count];
        weakcell.numlabel.text=numStr;
        weakcell.pricelabel.text=priceStr;
      
        [self reloadPrice];
        [tableview reloadData];
        
    };

    [cell loaddataWith:[shoppingthingsArray objectAtIndex:indexPath.row]];
         return cell;
    }else if(indexPath.section==2){
        
        static NSString *ID=@"ordercell";
        ordersettlementTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        if(!cell){
            cell=[[ordersettlementTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.moneylabel2.text=[NSString stringWithFormat:@"¥%@",allmoney];
        cell.cutmoneylabel2.text=@"-¥0";
        cell.freightlabel2.text=@"+¥0";
        cell.allthings.text=[NSString stringWithFormat:@"共%@件商品，合计：¥%@",number,allmoney];
        
        return cell;
        
    }
    else {return nil;}
    
}



#pragma mark tableviewdelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        addressViewController *addressVC=[[addressViewController alloc]init];
        
        [self.navigationController pushViewController:addressVC animated:YES];
        
        
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
