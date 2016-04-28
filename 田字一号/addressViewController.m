//
//  addressViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/25.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "addressViewController.h"
#import "UIView+SDAutoLayout.h"
#import "add_addressViewController.h"
#import "addressModel.h"
#import "addressTableViewCell.h"

@interface addressViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
    
    //NSMutableArray *addressArray;
}
@property(nonatomic,strong) NSMutableArray * addressArray;
@end

@implementation addressViewController

-(void)viewWillAppear:(BOOL)animated{
    
    
    [self.addressArray removeAllObjects];
    [self creatdata];
    [tableview reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"收货地址列表";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;
    
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    
    //self.addressArray=[NSMutableArray array];
   
    
    [self creatdata];
    
    UIButton *addaddressbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    addaddressbutton.backgroundColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    [addaddressbutton setTitle:@"新增收货地址" forState:UIControlStateNormal];
    [addaddressbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [addaddressbutton addTarget:self action:@selector(addaddressbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addaddressbutton];
    
    tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.00];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    
    
    
    addaddressbutton.sd_layout
    .bottomSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(65);
    

    tableview.sd_layout
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(addaddressbutton,0);

    
}


-(void)creatdata{
    
    
    NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
    
    if(data!=NULL){
     NSArray *array=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        self.addressArray = [[NSMutableArray alloc]initWithArray:array];
    }
    
}




#pragma mark tableviewdatasoure
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return self.addressArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"celladdress";
    addressTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[addressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
   
    
    [cell loadDataWithModel:self.addressArray[indexPath.section]];
    
    return cell;
}


#pragma mark tableviewdelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     addressModel *model=self.addressArray[indexPath.section];
     add_addressViewController *addVC=[[add_addressViewController alloc]init];
    
    addVC.hidesBottomBarWhenPushed=YES;
    addVC.view.hidden=NO;
    addVC.addresstofirst.hidden=NO;
    [addVC.setaddress setTitle:model.address forState:UIControlStateNormal];
    addVC.textfield2.text=model.addressmore;
    addVC.textfield3.text=model.name;
    addVC.textfield4.text=model.phonenumber;
    addVC.textfield5.text=model.postcode;
    addVC.completion=YES;
    [self.navigationController pushViewController:addVC animated:YES];
    
}



-(void)addaddressbuttonClick{
    
    add_addressViewController *addNewVC=[[add_addressViewController alloc]init];
    addNewVC.hidesBottomBarWhenPushed=YES;
   
    [self.navigationController pushViewController:addNewVC animated:YES];
    
    
    
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
