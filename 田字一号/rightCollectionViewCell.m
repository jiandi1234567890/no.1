//
//  rightCollectionViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/3/31.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "rightCollectionViewCell.h"

@implementation rightCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
        
        self.imageviewright=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*4/5)];
        [self addSubview:self.imageviewright];
        
        self.labelright=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)*4/5, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)/5)];
        
        self.labelright.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.labelright];
    
        
       
    }
    return self;
}
@end
