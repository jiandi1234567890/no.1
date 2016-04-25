//
//  addressTableViewCell.h
//  田字一号
//
//  Created by 张海禄 on 16/4/25.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addressModel.h"

@interface addressTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel * name;
@property(nonatomic,strong)  UILabel * address;
@property(nonatomic,strong) UILabel * phonenumber;
@property(nonatomic,strong) UIImageView * imageview;
-(void)loadDataWithModel:(addressModel *)model;
@end
