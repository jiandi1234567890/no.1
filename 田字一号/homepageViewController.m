//
//  homepageViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "homepageViewController.h"
#import "mainCollectionViewCell.h"
#import "buttonCollectionViewCell.h"
#import "messageViewController.h"
#import "labelCollectionViewCell.h"
#import "activityViewController.h"
#import "sortViewController.h"
#import "customercenterViewController.h"
#import "shareViewController.h"
#import "myordersViewController.h"
#import "DescriptionsViewController.h"
#import "mycollectionViewController.h"
#import "mymoneyViewController.h"
#import "XRCarouselView.h"
#import <objc/runtime.h>

#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface homepageViewController ()<UISearchBarDelegate,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,XRCarouselViewDelegate>

{   UISearchBar *searchbar;
    UIScrollView *imagescrollView;
    UIPageControl *imagepagecontrol;
    
}
@property(nonatomic,strong) XRCarouselView *XRCview;

@end



@implementation homepageViewController


//首页左按键

-(void)homepageleftbutton
{
    [self.navigationController.view endEditing:YES ];
    
   [self.tabBarController setSelectedIndex:4];
   
 }
//首页右按键
-(void)homepagerightbutton
{
    messageViewController *mVC=[[messageViewController alloc]init];
    //隐藏tabbar
    mVC.hidesBottomBarWhenPushed = YES;
       [self.navigationController pushViewController:mVC animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
       //首页搜索界面及左右按键
    //UIBarButtonItem *leftbutton=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_cont_sc.png"] style:UIBarButtonItemStyleDone target:self action:@selector(homepageleftbutton)];
    //UIBarButtonItem *rightbutton=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_xxan.png"] style:UIBarButtonItemStyleDone target:self action:@selector(homepagerightbutton)];

    
    //自定义按键
    UIButton *leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame=CGRectMake(0, 0, 20, 20);
    [leftbutton setImage:[UIImage imageNamed:@"navbar_menu.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(homepageleftbutton) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *rightbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame=CGRectMake(0, 0, 28, 28);
    [rightbutton setImage:[UIImage imageNamed:@"navbar_news.png"] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(homepagerightbutton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbutton];
    
    
    
        searchbar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
    searchbar.backgroundColor=[UIColor clearColor];
    searchbar.searchBarStyle=UISearchBarStyleDefault;
    searchbar.placeholder=@"输入关键字搜索商品";
    searchbar.delegate=self;
    
//        //将搜索条放在一个UIView上
//        UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
//        searchView.backgroundColor=[UIColor clearColor];
//        [searchView addSubview:searchbar];
    
    self.navigationItem.titleView=searchbar;
    self.navigationItem.leftBarButtonItem=left;
    self.navigationItem.rightBarButtonItem=right;
    
    [self initscrollview];
    
    
    //navigationcontroller子视图的格式
    //更改返回键样式
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //更改子视图title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    

}

//主页要显示的内容
-(void)initscrollview
{
    
    UIScrollView *mainscrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,ScreenWidth,ScreenHeight)];
    mainscrollView.delegate=self;
    mainscrollView.backgroundColor=[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    mainscrollView.contentSize=CGSizeMake(ScreenWidth, 1550);
    [self.view  addSubview:mainscrollView];
    
    
    //首页图片滑动栏
    //既有本地图片也有网络图片
    NSArray *arr3 = @[@"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", [UIImage imageNamed:@"banner1.jpg"], @"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", [UIImage imageNamed:@"banner2.jpg"],@"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];
    
    
    self.XRCview=[[XRCarouselView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 150) imageArray:arr3];
    self.XRCview.delegate=self;
    //设置分页控件指示器的颜色
    [self.XRCview setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor blueColor]];
    //设置图片切换的方式
    //self.XRCview.changeMode = ChangeModeFade;
    self.XRCview.changeMode=ChangeModeDefault;
    
    self.XRCview.time = 3;
    
    [mainscrollView addSubview:self.XRCview];
    
    
    //限时抢购栏
    
    UILabel *limitlabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 150+2+10, 10, 20)];
    NSString *strlimitlabel=@"限时抢购";
    //得到字体长度
    CGSize textSize = [strlimitlabel boundingRectWithSize:CGSizeMake(ScreenWidth, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil].size;
    [limitlabel setFrame:CGRectMake(10, 150+2+10, textSize.width, 20)];
    limitlabel.text=strlimitlabel;
    limitlabel.backgroundColor=[UIColor clearColor];
    [mainscrollView addSubview:limitlabel];
    
    UILabel *restlable=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(limitlabel.frame)-5, 150+2+15, 30, 13)];
    restlable.text=@"剩余";
    restlable.font=[UIFont systemFontOfSize:13];
    restlable.textColor=[UIColor redColor];
    restlable.backgroundColor=[UIColor clearColor];
    [mainscrollView addSubview:restlable];
    
    UILabel *timerlabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(limitlabel.frame)+25, 150+2+10, ScreenWidth/3+5, 20)];
    timerlabel.text=@" 2:22:50:39";
    timerlabel.textColor=[UIColor whiteColor];
    timerlabel.backgroundColor=[UIColor orangeColor];
    timerlabel.font=[UIFont boldSystemFontOfSize:20];
    [mainscrollView addSubview:timerlabel];
    
    
    /*
     
     UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
     flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
     flowLayout.minimumLineSpacing = 10.0;//行间距(最小值)
     flowLayout.minimumInteritemSpacing = 50.0;//item间距(最小值)
     flowLayout.itemSize = CGSizeMake(50, 50);//每一个cell的尺寸大小
     flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);//设置section的边距
     flowLayout.headerReferenceSize = CGSizeMake(320, 20);
     flowLayout.footerReferenceSize = CGSizeMake(320, 20);
     //第二个参数是cell的布局
     UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) collectionViewLayout:flowLayout];
     [flowLayout release];
     collectionView.dataSource = self;
     collectionView.delegate = self;
     collectionView.backgroundColor = [UIColor orangeColor];
     //1 注册复用cell(cell的类型和标识符)(可以注册多个复用cell, 一定要保证重用标示符是不一样的)注册到了collectionView的复用池里
     [collectionView registerClass:[CLCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
     
     //第一个参数:返回的View类型
     //第二个参数:设置View的种类(header, footer)
     //第三个参数:设置重用标识符
     [collectionView registerClass:[HeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
     [collectionView registerClass:[FootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier];
     [self.view addSubview:collectionView];
     [collectionView release];
     */
    
    
    //限时抢购下面的cells
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout1 setScrollDirection:UICollectionViewScrollDirectionVertical];
    //flowLayout.minimumLineSpacing = 0;//行间距(最小值)
    //flowLayout.minimumInteritemSpacing = 30;//item间距(最小值)
    flowLayout1.itemSize = CGSizeMake((ScreenWidth-20-30)/3, 130);//每一个cell的尺寸大小
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);//设置section的边距
    // flowLayout.headerReferenceSize = CGSizeMake(320, 20);
    // flowLayout.footerReferenceSize = CGSizeMake(320, 20);
    
    UICollectionView *collectionview1= [[UICollectionView alloc]initWithFrame:CGRectMake(10, 150+2+35,ScreenWidth-20,130) collectionViewLayout:flowLayout1];
    collectionview1.tag=101;
    //[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    //设置代理
    collectionview1.dataSource = self;
    collectionview1.delegate = self;
    collectionview1.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    [mainscrollView addSubview:collectionview1];
    
    //注册cell和ResuableView(相当于头部)
    [collectionview1 registerClass:[mainCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
    
    
    //签到分享等按键
    UICollectionViewFlowLayout *flowLayout2=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout2 setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout2.itemSize=CGSizeMake(ScreenWidth/5, 60);
    flowLayout2.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout2.minimumInteritemSpacing =0;//item间距(最小值)
    UICollectionView *collectionview2=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 280+2+35+8, ScreenWidth, 60) collectionViewLayout:flowLayout2];
    collectionview2.tag=102;
    collectionview2.dataSource=self;
    collectionview2.delegate=self;
    collectionview2.backgroundColor=[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    [mainscrollView addSubview:collectionview2];
    [collectionview2 registerClass:[buttonCollectionViewCell class] forCellWithReuseIdentifier:@"cell2"];
    
    //注册即领福利
    UIButton *button1=[[UIButton alloc] initWithFrame:CGRectMake(0, 280+60+60, ScreenWidth, 60)];
    [button1 setImage:[UIImage imageNamed:@"pic_ad1.jpg"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollView addSubview:button1];
    //5个天字一号鸡蛋未领取
    UIButton *button2=[[UIButton alloc] initWithFrame:CGRectMake(0, 60+10+280+120, ScreenWidth, 60)];
    [button2 setImage:[UIImage imageNamed:@"pic_ad2.jpg"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollView addSubview:button2];
    
    
    //健康鲜肉103
    UICollectionViewFlowLayout *flowLayout3=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout3 setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout3.itemSize=CGSizeMake(ScreenWidth, 35);
    flowLayout3.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout3.minimumInteritemSpacing =0;//item间距(最小值)
    UICollectionView *collectionview3=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 120+280+140, ScreenWidth, 35) collectionViewLayout:flowLayout3];
    collectionview3.tag=103;
    collectionview3.dataSource=self;
    collectionview3.delegate=self;
    collectionview3.backgroundColor=[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    [mainscrollView addSubview:collectionview3];
    [collectionview3 registerClass:[labelCollectionViewCell class] forCellWithReuseIdentifier:@"cell3"];
    
    //健康鲜肉下面6个item
    UICollectionViewFlowLayout *flowLayout4 = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout4 setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    flowLayout4.itemSize = CGSizeMake((ScreenWidth-20-30)/3, 130);//每一个cell的尺寸大小
    flowLayout4.sectionInset = UIEdgeInsetsMake(0,5, 0, 5);//设置section的边距
    
    UICollectionView *collectionview4= [[UICollectionView alloc]initWithFrame:CGRectMake(10, 150+280+175,ScreenWidth-20,280+20) collectionViewLayout:flowLayout4];
    collectionview4.tag=104;
    collectionview4.dataSource = self;
    collectionview4.delegate = self;
    collectionview4.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    [mainscrollView addSubview:collectionview4];
    [collectionview4 registerClass:[mainCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
    //应季水果、时令鲜蔬、生态农副、预售专区105
    UICollectionViewFlowLayout *flowLayout5=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout5 setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout5.itemSize=CGSizeMake(ScreenWidth, 35);
    flowLayout5.sectionInset=UIEdgeInsetsMake(5, 0, 5, 0);
    flowLayout5.minimumInteritemSpacing =0;//item间距(最小值)
    UICollectionView *collectionview5=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 870, ScreenWidth, 35*4+5*8) collectionViewLayout:flowLayout5];
    collectionview5.tag=105;
    collectionview5.dataSource=self;
    collectionview5.delegate=self;
    collectionview5.backgroundColor=[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
    [mainscrollView addSubview:collectionview5];
    [collectionview5 registerClass:[labelCollectionViewCell class] forCellWithReuseIdentifier:@"cell3"];
    
    
    //美味活动
    UILabel *moreactivitylabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 35*4+5*8+860+25, ScreenWidth, 45)];
    moreactivitylabel.text=@"  更多美味、活动推荐";
    moreactivitylabel.font=[UIFont systemFontOfSize:17];
    moreactivitylabel.backgroundColor=[UIColor whiteColor];
    moreactivitylabel.textAlignment=NSTextAlignmentLeft;
    [mainscrollView addSubview:moreactivitylabel];
    
    UIButton *moreactivitybutton=[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-135,35*4+5*8+860+43, 135, 13)];
    moreactivitybutton.backgroundColor=[UIColor clearColor];
    [moreactivitybutton setTitle:@"爆款新鲜美食任你选>" forState:UIControlStateNormal];
    [moreactivitybutton setTitleColor: [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00] forState:UIControlStateNormal];
    moreactivitybutton.titleLabel.font=[UIFont systemFontOfSize:13];
    [moreactivitybutton addTarget:self action:@selector(moreactivitybuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollView addSubview:moreactivitybutton];
    
    
    
    //底部三张图片按钮
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame=CGRectMake(0, 1100+20, ScreenWidth, 130);
    [button3 setImage:[UIImage imageNamed:@"img_hd1.jpg"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollView addSubview:button3];
    
    
    UIButton *button4=[UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame=CGRectMake(0,  130+1130, ScreenWidth, 130);
    [button4 setImage:[UIImage imageNamed:@"img_hd2.jpg"] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollView addSubview:button4];
    
    
    UIButton *button5=[UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame=CGRectMake(0, 130*2+1140, ScreenWidth, 130);
    [button5 setImage:[UIImage imageNamed:@"img_hd3.jpg"] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchUpInside];
    [mainscrollView addSubview:button5];
    

    
}


#pragma mark XRCarouselViewDelegate
//点击图片的事件
- (void)carouselView:(XRCarouselView *)carouselView didClickImage:(NSInteger)index {
    [self.tabBarController setSelectedIndex:1];
    NSLog(@"点击了第%ld张图片", index);
}

//滑动时开启关闭定时器
- (IBAction)start:(id)sender {
    [self.XRCview startTimer];
}

- (IBAction)stop:(id)sender {
    [self.XRCview stopTimer];
}





//健康鲜肉等按键相应时间
-(void)labelbuttonClick:(UIButton *)button
{
    NSInteger number;
  
    if(button.tag==103)
    {
       number=1;
        
        NSLog(@"点击了健康鲜肉的按钮");
    }
    else if(button.tag==104)
    {
        number=2;
      
        NSLog(@"点击了应季水果的按钮");
    }
    else if(button.tag==105)
    {
       number=3;
       
        NSLog(@"点击了时令鲜蔬的按钮");
    }
    else if(button.tag==106)
    {
        number=4;
        NSLog(@"点击了生态农副的按钮");
    }
    else if(button.tag==107)
    {
        number=5;
        NSLog(@"点击了预售专区的按钮");
    }
   
    [[NSUserDefaults standardUserDefaults] setInteger:number forKey:@"homepage"];
    
 
   [self.tabBarController setSelectedIndex:2];
    
}


//注册即领福利
-(void)button1Click
{
    [self.tabBarController setSelectedIndex:4];
    NSLog(@"判断是否登陆");
}
//5个天字一号鸡蛋未领取
-(void)button2Click
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.farmno1.com/"]];
}

//调系统浏览器浏览网页
-(void) button3Click
{
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.farmno1.com/"]];
}
//爆款美食任你选
-(void)moreactivitybuttonClick
{
    [self.tabBarController setSelectedIndex:1];
}


//首页图片滑动页码切换
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page=imagescrollView.contentOffset.x/ScreenWidth+0.5;
    imagepagecontrol.currentPage=page;
    
    // NSLog(@"%ld",page);
}



#pragma mark -- UICollectionViewDataSource
//定义每个section中UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(collectionView.tag==101)
    {
        return 3;
    }
    else if(collectionView.tag==102)
    {
        return 5;
    }else if(collectionView.tag==103|collectionView.tag==105)
    {
        return 1;
    }
    else if(collectionView.tag==104)
    {
        return 6;
    }
    
    else  return 0;
}
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(collectionView.tag==101|collectionView.tag==102|collectionView.tag==103|collectionView.tag==104)
    {
        return 1;
   }
    else if(collectionView.tag==105)
    {
        return 4;
    }

    else return 0;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(collectionView.tag==101)
    {
        NSArray *titlearray=@[@"龙骨",@"筒骨",@"猪前腿肉"];
        static NSString *ID = @"cell1";
        mainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        if (!cell) {
            NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
        }
        cell.imageView.image = [UIImage imageNamed:@"pic_tj1.jpg"];
        cell.firstlabel.text = [NSString stringWithFormat:@"田子一号%@",titlearray[indexPath.row]];
        cell.secondlabel.text=[NSString stringWithFormat:@"¥ 32.%ld0",(long)indexPath.row];
        
        return cell;
    }
    else if(collectionView.tag==102)
    {
        
        NSArray *titleArray2=@[@"签到赚积分",@"分享有礼",@"我的订单",@"收藏夹",@"账户充值"];
        NSArray *imgArray2=@[@"icon_qdzjf.png",@"icon_fxyl.png",@"icon_wddd.png",@"icon_scj.png",@"icon_zhcz.png"];
        static NSString *ID = @"cell2";
        buttonCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        
        [cell sizeToFit];
        if (!cell) {
            NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
        }
        cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",imgArray2[indexPath.row]]];
        cell.label.text=[NSString stringWithFormat:@"%@",titleArray2[indexPath.row]];
        return cell;
    }
    else if(collectionView.tag==103)
    {
        static NSString *ID = @"cell3";
        labelCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        cell.label1.text=@"健康鲜肉";
        [cell.button addTarget:self action:@selector(labelbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.button.tag=103;
        return cell;
    }
    else if(collectionView.tag==104)
    {
        
        NSArray *titleArray4=@[@"河田鸡(公)",@"田字一号带皮猪扒",@"田字一号精品五花肉",@"田字一号猪肝",@"田字一号扇骨",@"田字一号猪后腿肉"];
        NSArray *priceArray4=@[@"¥198.00",@"¥ 24.80",@"¥ 27.80",@"¥ 25.00",@"¥  0.01",@"¥ 18.80"];
        static NSString *ID = @"cell1";
        mainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        if (!cell) {
        
            NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
        }
        cell.imageView.image = [UIImage imageNamed:@"pic_tj2.jpg"];
        cell.firstlabel.text = titleArray4[indexPath.row];
        cell.secondlabel.text=priceArray4[indexPath.row];
        
        return cell;
        
    }
    else if(collectionView.tag==105)
    {  //应季水果、时令鲜蔬、生态农副、预售专区
        NSArray *labelArray5=@[@"应季水果",@"时令鲜蔬",@"生态农副",@"预售专区"];
        static NSString *ID = @"cell3";
        labelCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        if (!cell) {
            NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
        }
       
        cell.label1.text=labelArray5[indexPath.section];
        [cell.button addTarget:self action:@selector(labelbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.button.tag=104+indexPath.section;
        return cell;
           }
    else return 0;
    
    
}




//#pragma mark --UICollectionViewDelegateFlowLayout
////定义每个UICollectionView 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    //边距占5*4=20 ，2个
//    //图片为正方形，边长：(sizewidth-20)/2-5-5 所以总高(sizewidth-20)/2-5-5 +20+30+5+5 label高20 btn高30
//    //return CGSizeMake((sizewidth-20)/2, (sizewidth-20)/2 +50);
//    //return CGSizeMake(50, 50);
//
//    //边距占5*10=50 ，5个
//    //图片为正方形，边长：(sizewidth-50)/5 -5-5 所以总高(sizewidth-50)/5-5-5 +20+30+5+5 label高20 btn高30
//    return CGSizeMake((sizewidth-50)/5, (sizewidth-50)/5 +50);
//    //return CGSizeMake(50, 50);
//}
////定义每个UICollectionView 的间距
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(5, 5, 5, 0);//上下左右
//}
////定义每个UICollectionView 纵向的间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}


#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(collectionView.tag==101)
    {
        DescriptionsViewController *desVC=[[DescriptionsViewController alloc]init];
        desVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:desVC animated:YES];
    
        NSLog(@"限时抢购%ld",(long)indexPath.row);
        
    }
    else if(collectionView.tag==102)
    {
        
        switch (indexPath.row) {
            case 0:
            {   NSInteger denglu=[[NSUserDefaults standardUserDefaults] integerForKey:@"login"];
                if(denglu==100){
                    [self showMessage:@"恭喜签到获得1积分"];
                }else{
                    [self.tabBarController setSelectedIndex:4];
                }
                NSLog(@"签到赚积分");
            }
                break;
            case 1:
            {
                shareViewController *shareVC=[[shareViewController alloc]init];
                shareVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:shareVC animated:YES];
            }
                NSLog(@"分享有礼");
                break;
            case 2:
            {
                NSLog(@"我的订单");
                myordersViewController *moVC=[[myordersViewController alloc]init];
                moVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:moVC animated:YES];
            }
              
                break;
            case 3:
            {
                NSLog(@"收藏夹");
                mycollectionViewController *collectionVC=[[mycollectionViewController alloc]init];
                collectionVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
                
            }
                break;
            case 4:
            {
                NSLog(@"账户充值");
                mymoneyViewController *myVC=[[mymoneyViewController alloc]init];
                myVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:myVC animated:YES];
                
                
            }
                break;
                
            default:
                break;
        }
        
       
    }
    else if(collectionView.tag==103)
    {
        // NSLog(@"按键%ld",indexPath.row);
        //[self labelbuttonClick:collectionView];
    }
    else if(collectionView.tag==104)
        
    {
        DescriptionsViewController *desVC=[[DescriptionsViewController alloc]init];
        desVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:desVC animated:YES];

        
        NSLog(@"健康鲜肉%ld",(long)indexPath.row);
    }
}
//返回这个UICollectionView是否可以被选择
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}






//签到提醒显示
-(void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 0.8f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
   CGSize LabelSize=[message boundingRectWithSize:CGSizeMake(ScreenWidth, 999) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]} context:nil].size;
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    [showview addSubview:label];
    showview.frame = CGRectMake((ScreenWidth - LabelSize.width - 20)/2, ScreenHeight/2, LabelSize.width+20, LabelSize.height+10);
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
