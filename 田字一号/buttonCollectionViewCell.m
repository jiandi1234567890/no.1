//
//  buttonCollectionViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/3/29.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "buttonCollectionViewCell.h"

@implementation buttonCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/4, 5, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2+3)];
        //self.imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetWidth(self.frame)/2+4, CGRectGetWidth(self.frame), 11)];
        self.label.font= [UIFont systemFontOfSize:11];
       
        self.label.backgroundColor =[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
           }
    return self;
}




@end
