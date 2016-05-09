//
//  searchViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/5/9.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "searchViewController.h"
#import "UIView+SDAutoLayout.h"
#import "shoppingcartModel.h"
#import "shoppingcartTableViewCell.h"
#import "DescriptionsViewController.h"



@interface searchViewController ()<UISearchBarDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIView *view1;
    UIView *view2;
    UIView *view3;
    UIView *view4;
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;

    //展示用的模型数组
    NSMutableArray *dataarray;

}
@property(nonatomic,strong) UIScrollView * scrollview;
@property(nonatomic,strong) UITableView * tableview;

@end

@implementation searchViewController


-(void)ringhtbuttonClick{
    
    [self.tabBarController setSelectedIndex:0];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}



-(void)button1Click{
    
    
    [button1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.tableview.tag=101;
    [self creatData];
    
    self.scrollview.contentOffset=CGPointMake(0, 0);
    [self.tableview reloadData];
     [view1 addSubview:self.tableview];
    self.tableview.sd_layout
    .topSpaceToView(view1,0)
    .bottomSpaceToView(view1,0)
    .leftSpaceToView(view1,0)
    .rightSpaceToView(view1,0);
    
}

-(void)button2Click{
    
    
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    self.tableview.tag=102;
    [self creatData];
    self.scrollview.contentOffset=CGPointMake(self.scrollview.frame.size.width, 0);
    [self.tableview reloadData];
     [view2 addSubview:self.tableview];
    self.tableview.sd_layout
    .topSpaceToView(view2,0)
    .bottomSpaceToView(view2,0)
    .leftSpaceToView(view2,0)
    .rightSpaceToView(view2,0);
    
}

-(void)button3Click{
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
    
    self.scrollview.contentOffset=CGPointMake(self.scrollview.frame.size.width*2, 0);
    self.tableview.tag=103;
    [self creatData];
    [self.tableview reloadData];
     [view3 addSubview:self.tableview];
    self.tableview.sd_layout
    .topSpaceToView(view3,0)
    .bottomSpaceToView(view3,0)
    .leftSpaceToView(view3,0)
    .rightSpaceToView(view3,0);
    

    
}

-(void)button4Click{
    
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    

    
    
    self.scrollview.contentOffset=CGPointMake(self.scrollview.frame.size.width*3, 0);
    self.tableview.tag=104;
    [self creatData];
    [self.tableview reloadData];
     [view4 addSubview:self.tableview];
    self.tableview.sd_layout
    .topSpaceToView(view4,0)
    .bottomSpaceToView(view4,0)
    .leftSpaceToView(view4,0)
    .rightSpaceToView(view4,0);
    

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataarray=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[UIColor redColor];
    self.navigationController.navigationBar.translucent=NO;
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    
   UISearchBar *searchbar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 250, 45)];
    searchbar.backgroundColor=[UIColor clearColor];
    searchbar.searchBarStyle=UISearchBarStyleMinimal;
    searchbar.placeholder=@"输入关键字搜索商品";
    searchbar.delegate=self;
    
    UIView *searchview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 45)];
    searchview.backgroundColor=[UIColor clearColor];
    [searchview addSubview:searchbar];
    
    
//返回首页按键
    UIButton *rightbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame=CGRectMake(0, 0, 25, 25);
    [rightbutton setImage:[UIImage imageNamed:@"tab_home_light.png"] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(ringhtbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbutton];
     self.navigationItem.titleView=searchview;
    
    self.navigationItem.rightBarButtonItem=right;
    
    
    
    
    self.scrollview=[[UIScrollView alloc]init];
    self.scrollview.backgroundColor=[UIColor whiteColor];
//    //  设置隐藏横向条
//    self.scrollview.showsHorizontalScrollIndicator = NO;
    //  设置自动分页
    self.scrollview.pagingEnabled = YES;
    self.scrollview.delegate=self;

    [self.scrollview setContentSize:CGSizeMake(self.view.frame.size.width*4, 0)];
    
    [self.view addSubview:self.scrollview];
    
    
    
    
    
    
    button1=[UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor=[UIColor whiteColor];
    [button1 setTitle:@"默认" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
   button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor=[UIColor whiteColor];
    [button2 setTitle:@"最新" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    button3=[UIButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor=[UIColor whiteColor];
    [button3 setTitle:@"销量" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    button4=[UIButton buttonWithType:UIButtonTypeCustom];
    button4.backgroundColor=[UIColor whiteColor];
    [button4 setTitle:@"价格" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(button4Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
   
    
    
    view1=[[UIView alloc]init];
    view1.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view1];
    
    
   view2=[[UIView alloc]init];
    view2.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view2];
    
    view3=[[UIView alloc]init];
    view3.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view3];
    
    view4=[[UIView alloc]init];
    view4.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view4];
    
    
    
    
    self.tableview=[[UITableView alloc]init];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableview.tag=101;
    
    //数据构建
    [self creatData];
    
    
    [view1 addSubview:self.tableview];
    

  
    
    self.view.sd_equalWidthSubviews=@[button1,button2,button3,button4];

    button1.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(35);
    
    button2.sd_layout
    .topEqualToView(button1)
    .leftSpaceToView(button1,0)
    .heightIs(35);
    
    button3.sd_layout
    .topEqualToView(button1)
    .leftSpaceToView(button2,0)
    .heightIs(35);
    
    button4.sd_layout
    .topEqualToView(button1)
    .leftSpaceToView(button3,0)
    .heightIs(35);
    
    
    self.scrollview.sd_layout
    .topSpaceToView(button1,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    
  
    view1.sd_layout
    .topSpaceToView(self.scrollview,0)
    .bottomSpaceToView(self.scrollview,0)
    .leftSpaceToView(self.scrollview,0)
    .widthIs(self.view.frame.size.width);
    
    self.tableview.sd_layout
    .topSpaceToView(view1,0)
    .bottomSpaceToView(view1,0)
    .leftSpaceToView(view1,0)
    .rightSpaceToView(view1,0);
    
    
    view2.sd_layout
    .topSpaceToView(self.scrollview,0)
    .bottomSpaceToView(self.scrollview,0)
    .leftSpaceToView(view1,0)
   .widthIs(self.view.frame.size.width);
    
    view3.sd_layout
    .topSpaceToView(self.scrollview,0)
    .bottomSpaceToView(self.scrollview,0)
    .leftSpaceToView(view2,0)
     .widthIs(self.view.frame.size.width);
    
    
    view4.sd_layout
    .topSpaceToView(self.scrollview,0)
    .bottomSpaceToView(self.scrollview,0)
    .leftSpaceToView(view3,0)
     .widthIs(self.view.frame.size.width);
   
}



//展示模型
-(void)creatData {
    
    [dataarray removeAllObjects];
        switch (self.tableview.tag) {
            case 101:
            {
                for (int i = 0; i < 6; i++) {
                    shoppingcartModel *model = [[shoppingcartModel alloc]init];
                    
                    model.namestr = @"田字一号筒骨";
                    model.number =1;
                    model.imagename =@"pic_tj1.jpg";
                    
                    
                    [dataarray addObject:model];
                }
  
                
                
            }
                break;
    
            case 102:
            {
                for (int i = 0; i < 6; i++) {
                    shoppingcartModel *model = [[shoppingcartModel alloc]init];
                    
                    model.namestr = @"田字一号猪肉";
                    model.number =1;
                    model.imagename =@"pic_tj2.jpg";
                    
                    
                    [dataarray addObject:model];
                }
                

                
            }break;
    
            case 103:
            {
                for (int i = 0; i < 6; i++) {
                    shoppingcartModel *model = [[shoppingcartModel alloc]init];
                    
                    model.namestr = @"田字一号筒骨";
                    model.number =1;
                    model.imagename =@"pic_tj1.jpg";
                    
                    
                    [dataarray addObject:model];
                }
                

                
            }break;
            case 104:
            {
                for (int i = 0; i < 6; i++) {
                    shoppingcartModel *model = [[shoppingcartModel alloc]init];
                    
                    model.namestr = @"田字一号";
                    model.number =1;
                    model.imagename =@"pic_tj2.jpg";
                    
                    
                    [dataarray addObject:model];
                }
                

                
            }
                break;
            default:
                break;
        }
    
}




#pragma mark tableviewdatasource


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
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
    
    cell.selectbutton.hidden=YES;
    cell.numlabel.hidden=YES;
    cell.cutnumbutton.hidden=YES;
    cell.addnumbutton.hidden=YES;
    cell.deletebutton.hidden=YES;
    
    [cell loaddataWith:[dataarray objectAtIndex:indexPath.section]];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DescriptionsViewController *DesVC=[[DescriptionsViewController alloc]init];
    
    [self.navigationController pushViewController:DesVC animated:YES];
    
    
}





#pragma mark scrollviewdelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    float offset = self.scrollview.contentOffset.x;

   if(offset==0)
   {
       [self button1Click];
   }else if(offset==[UIScreen mainScreen].bounds.size.width){
       [self button2Click];
   }else  if(offset==[UIScreen mainScreen].bounds.size.width*2){
       [self button3Click];
   }else if(offset==[UIScreen mainScreen].bounds.size.width*3) {
       [self button4Click];
   }
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
