//
//  shoppingcartModel.h
//  田字一号
//
//  Created by 张海禄 on 16/4/14.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface shoppingcartModel : NSObject
@property(nonatomic,copy) NSString *namestr;
@property(nonatomic,copy) NSString *pricestr;
@property(nonatomic,assign)  NSInteger  number;
@property(nonatomic,retain)  UIImage * image;
@property (nonatomic,assign)BOOL isSelected;

@end
