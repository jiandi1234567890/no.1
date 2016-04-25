//
//  labelCollectionViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/3/29.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "labelCollectionViewCell.h"

@implementation labelCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.label1=[[UILabel alloc]initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.frame)-30, CGRectGetHeight(self.frame))];
        
        self.label1.font=[UIFont systemFontOfSize:18];
        self.label1.textAlignment=NSTextAlignmentLeft;
        self.label1.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.label1];
        
        
        self.button=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-50,2,50, CGRectGetHeight(self.frame))];
        [self.button setTitle:@"更多>" forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00] forState:UIControlStateNormal];
        self.button.titleLabel.font=[UIFont systemFontOfSize:13];
//        self.button.titleLabel.font=[UIFont systemFontOfSize:13];
//        self.button.titleLabel.text=@"更多>";
//        self.button.titleLabel.textColor=[UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
//        self.button .backgroundColor=[UIColor whiteColor];
        [self addSubview:self.button ];
        
        
        self.view=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-2, CGRectGetWidth(self.frame), 2)];
        self.view.backgroundColor=[UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1.00];
        [self addSubview:self.view];
        
        
          }
    return self;
}

@end
