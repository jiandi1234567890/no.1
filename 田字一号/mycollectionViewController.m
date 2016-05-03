//
//  mycollectionViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/29.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "mycollectionViewController.h"
#import "XRCarouselView.h"
#import <objc/runtime.h>
#import "UIView+SDAutoLayout.h"

@interface mycollectionViewController ()<XRCarouselViewDelegate>
@property(nonatomic,strong) XRCarouselView *XRCview;

@end

@implementation mycollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的收藏";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    
    
    //本地图片
    NSArray *arr1 = @[[UIImage imageNamed:@"banner1.jpg"], [UIImage imageNamed:@"banner2.jpg"], [UIImage imageNamed:@"banner3.jpg"]];
   
    
    //网络图片
    NSArray *arr2 = @[@"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", @"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", @"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];
    
    //既有本地图片也有网络图片
    NSArray *arr3 = @[@"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", [UIImage imageNamed:@"banner1.jpg"], @"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", [UIImage imageNamed:@"banner2.jpg"],@"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];

    
    self.XRCview=[[XRCarouselView alloc]init];
    self.XRCview.imageArray=arr3;
    self.XRCview.delegate=self;
    //设置分页控件指示器的颜色
    [self.XRCview setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor blueColor]];
    //设置图片切换的方式
    self.XRCview.changeMode = ChangeModeFade;

   self.XRCview.time = 3;
    
    [self.view addSubview:self.XRCview];
    
    self.XRCview.sd_layout
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(140);
    
}

#pragma mark XRCarouselViewDelegate
//点击图片的事件
- (void)carouselView:(XRCarouselView *)carouselView didClickImage:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}

//滑动时开启关闭定时器
- (IBAction)start:(id)sender {
    [self.XRCview startTimer];
}

- (IBAction)stop:(id)sender {
    [self.XRCview stopTimer];
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
