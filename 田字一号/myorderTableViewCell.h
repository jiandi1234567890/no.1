//
//  myorderTableViewCell.h
//  田字一号
//
//  Created by 张海禄 on 16/4/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoppingcartModel.h"

@interface myorderTableViewCell : UITableViewCell
//订单号
@property(nonatomic,strong) UILabel * numberoforder;
//订单状态
@property(nonatomic,strong) UILabel * orderstate;
//图片
@property(nonatomic,strong) UIImageView * imageview;
//名称
@property(nonatomic,strong) UILabel * name;
//价格及数量
@property(nonatomic,strong) UILabel * price;
//总价格
@property(nonatomic,strong) UILabel * allmoney;
//商家配货状态
@property(nonatomic,strong) UILabel * orderblank;
//退款按键
@property(nonatomic,strong) UIButton * cancel;

-(void)loadDataWithModel:(shoppingcartModel *)model;
@end
