//
//  sortViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "sortViewController.h"
#import "leftTableViewCell.h"
#import "rightCollectionViewCell.h"
#import "DescriptionsViewController.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface sortViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>


@end

@implementation sortViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
       self.view.backgroundColor=[UIColor whiteColor];
    //不计算navigationbar高度，解决scrollerview位置偏移问题
    self.navigationController.navigationBar.translucent=NO;
   
    //左侧tableview
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,5, 95, ScreenHeight) style:UITableViewStylePlain];
    self.tableview.backgroundColor=[UIColor whiteColor];
    [self.tableview setSeparatorColor:[UIColor clearColor]];
    //启用代理
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    //禁止滚动
    self.tableview.scrollEnabled=NO;
     [self.view addSubview:self.tableview];
    //右侧collectionview
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowlayout.itemSize=CGSizeMake((ScreenWidth-115-20)/2, (ScreenHeight-140)/3);
    flowlayout.sectionInset=UIEdgeInsetsMake(0, 5, 0, 5);//设置section的边距

    self.collectionview=[[UICollectionView alloc]initWithFrame:CGRectMake(95+10, 7, ScreenWidth-115, ScreenHeight-73-54) collectionViewLayout:flowlayout];
    self.collectionview.dataSource=self;
    self.collectionview.delegate=self;
   self.collectionview.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:self.collectionview];
    [self.collectionview registerClass:[rightCollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
    
    
    
    //navigationcontroller子视图的格式
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
   
    
}

#pragma mark UITableViewDatasource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//行数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID=@"cell1";
    
    leftTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
        {
            cell=[[leftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
    NSArray *leftimgArray=@[@"icon_wntj.png",@"icon_jkxr.png",@"icon_yjsg.png",@"icon_slxs.png",@"icon_stnf.png",@"icon_yszq.png"];
    NSArray *leftlabelArray=@[@"全部分类",@"健康鲜肉",@"应季水果",@"时令鲜蔬",@"生态农副",@"预售专区"];
    NSArray *imglightArray=@[@"icon_wntj_h.png",@"icon_jkxr_h.png",@"icon_yjsg_h.png",@"icon_slxs_h.png",@"icon_stnf_h.png",@"icon_yszq_h.png"];

      cell.imageviewleft.image=[UIImage imageNamed:leftimgArray[indexPath.row]];
      cell.labelleft.text=leftlabelArray[indexPath.row];
    //自定义cell选中时背景
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
       cell.imageviewleft.highlightedImage=[UIImage imageNamed:imglightArray[indexPath.row]];
    cell.labelleft.highlightedTextColor=[UIColor colorWithRed:0.96 green:0.54 blue:0.35 alpha:1.00];
        return cell;
       
}


#pragma make UITableViewDelegate
//tableview 不写的话默认是44
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
    
}
//默认选中第几个tableviewcell
-(void)viewDidAppear:(BOOL)animated
{
    //取出存在文件中homepage传过来的值
    _leftviewnumber=[[NSUserDefaults standardUserDefaults]integerForKey:@"homepage"];
    NSInteger selectedIndex =_leftviewnumber;
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    
    [self.tableview selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [super viewDidAppear:animated];
    

    _leftviewnumber=selectedIndexPath.row;
    
    [self.collectionview reloadData];
     NSLog(@"这里的leftnumber：%ld",(long)_leftviewnumber);
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSLog(@"点击了左边cell按钮 %ld",(long)indexPath.row);
    _leftviewnumber=indexPath.row;
    [[NSUserDefaults standardUserDefaults] setInteger:_leftviewnumber forKey:@"homepage"];
    [self.collectionview reloadData];
}


////homgepage传过来的number
//
//-(void)setLeftviewnumber:(NSInteger)leftviewnumber
//{
//   _leftviewnumber=leftviewnumber;
//   
//    NSLog(@"homepage传过来的number：%ld",_leftviewnumber);
//}




#pragma mark -- UICollectionViewDataSource
//cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger number;
    switch (_leftviewnumber) {
        case 0:
            number=7;
            break;
            
        case 1:
            number=3;
            break;
        case 2:
            number=1;
            break;
        case 3:
            number=1;
            break;
        case 4:
            number=1;
            break;
        case 5:
            number=1;
            break;
        default:
            break;
    }
    return number;
}




//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *rightlabelArray=@[@"猪肉",@"鸡肉",@"苹果",@"绿色蔬菜",@"牛肉",@"农副1",@"预售1"];
    NSArray *rightimgArray=@[@"pic_tj1.jpg",@"pic_tj2.jpg",@"pic_goodscont2.jpg",@"pic_goods1.jpg",@"pic_tj1.jpg",@"pic_goods5.jpg",@"pic_goods5.jpg"];
    
       //  NSLog(@"%@",labelArray);
    NSPredicate *predicate=[[NSPredicate alloc]init];
    NSArray *labelArray=[NSArray array];
    static NSString *ID = @"mycell";
   rightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    switch (_leftviewnumber) {
        case 0://全部
            cell.imageviewright.image=[UIImage imageNamed:rightimgArray[indexPath.row]];
            cell.labelright.text=rightlabelArray[indexPath.row];
            break;
            
        case 1://@"健康鲜肉"
           predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"肉"]; //predicate只能是对象
           labelArray=[rightlabelArray filteredArrayUsingPredicate:predicate];
            
            cell.imageviewright.image=[UIImage imageNamed:rightimgArray[indexPath.row]];
            cell.labelright.text=labelArray[indexPath.row];
            break;
        case 2://@"应季水果"
            predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"果"]; //predicate只能是对象
            labelArray=[rightlabelArray filteredArrayUsingPredicate:predicate];
            
            cell.imageviewright.image=[UIImage imageNamed:rightimgArray[2]];
            cell.labelright.text=labelArray[indexPath.row];
            break;
        case 3://@"时令鲜蔬"
            predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"蔬"]; //predicate只能是对象
            labelArray=[rightlabelArray filteredArrayUsingPredicate:predicate];
            
            cell.imageviewright.image=[UIImage imageNamed:rightimgArray[3]];
            cell.labelright.text=labelArray[indexPath.row];
            break;
        case 4://@"生态农副"
            predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"农"]; //predicate只能是对象
            labelArray=[rightlabelArray filteredArrayUsingPredicate:predicate];
            
            cell.imageviewright.image=[UIImage imageNamed:rightimgArray[4]];
            cell.labelright.text=labelArray[indexPath.row];
            break;
        case 5://@"预售专区"
            predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"预"]; //predicate只能是对象
            labelArray=[rightlabelArray filteredArrayUsingPredicate:predicate];
            
            cell.imageviewright.image=[UIImage imageNamed:rightimgArray[5]];
            cell.labelright.text=labelArray[indexPath.row];
            break;
        default:
            break;
    }
   [cell sizeToFit];
    
    return cell;

}






#pragma mark --UICollectionViewDelegate


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
   
        DescriptionsViewController *desVC=[[DescriptionsViewController alloc]init];
        desVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:desVC animated:YES];
        
    

    
    NSLog(@"%ld",(long)indexPath.row);
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
