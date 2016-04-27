//
//  shoppingcartTableViewCell.h
//  田字一号
//
//  Created by 张海禄 on 16/4/14.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoppingcartModel.h"

typedef void(^CartBlock)(BOOL select);

typedef void(^numberchange)  ();

@interface shoppingcartTableViewCell : UITableViewCell


@property(nonatomic,copy)CartBlock cartBlock;
@property(nonatomic,copy) numberchange addnumber;
@property(nonatomic,copy) numberchange cutnumber;
@property(nonatomic,copy) numberchange deletecell;
@property (nonatomic,assign)BOOL isSelected;
//选择按键
@property(nonatomic,strong) UIButton * selectbutton;
//产品图片
@property(nonatomic,strong) UIImageView * imageview;
//产品名称
@property(nonatomic,strong) UILabel * namelabel;
//产品数量减按键
@property(nonatomic,strong) UIButton * cutnumbutton;
//产品数量
@property(nonatomic,strong) UILabel * numlabel;
//产品数量加按键
@property(nonatomic,strong) UIButton * addnumbutton;
//产品价格
@property(nonatomic,strong) UILabel * pricelabel;
//删除按键
@property(nonatomic,strong) UIButton * deletebutton;



-(void) loaddataWith:(shoppingcartModel *)model;
@end
