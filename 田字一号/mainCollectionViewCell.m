//
//  mainCollectionViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "mainCollectionViewCell.h"

@implementation mainCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*2/3)];
        //self.imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imageView];
        
        self.firstlabel = [[UILabel alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(self.imageView.frame)+5, CGRectGetWidth(self.frame)-4, 15)];
        self.firstlabel.font=[UIFont systemFontOfSize:13];
        self.firstlabel.backgroundColor = [UIColor whiteColor];
        self.firstlabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.firstlabel];
        
        self.secondlabel = [[UILabel alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(self.firstlabel.frame)+3,CGRectGetWidth(self.frame)-4 , 15)];
        
       self.secondlabel.font=[UIFont systemFontOfSize:13];
        self.secondlabel.backgroundColor = [UIColor clearColor];
        self.secondlabel.textColor=[UIColor orangeColor];
        self.secondlabel.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:self.secondlabel];
        
//        CGSize secondlabelsize=[self.secondlabel.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;

        self.thirdlabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.secondlabel.frame)*2/3, CGRectGetMaxY(self.firstlabel.frame)+5, 15, 11)];
        
        self.thirdlabel.backgroundColor = [UIColor whiteColor];
        self.thirdlabel.text=@"/份";
        self.thirdlabel.font=[UIFont systemFontOfSize:9];
        self.thirdlabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.thirdlabel];
        
          }
    return self;
}


@end
