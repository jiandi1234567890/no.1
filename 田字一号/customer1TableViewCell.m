//
//  customer1TableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/11.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "customer1TableViewCell.h"
#define imageviewsize  18
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width


@implementation customer1TableViewCell



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    if(self)
    {
        
        
        self.imageView1=[[UIImageView alloc]init];
                        
        
       
        
        self.firstlabel=[[UILabel alloc]init];
      
        
        
        
        self.imageView2=[[UIImageView alloc]init];
        
        self.secondlabel=[[UILabel alloc]init];
        
        
    }
    
    
    
    return self;
    
}




-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundColor=[UIColor whiteColor];
    
    
     self.imageView1.frame=CGRectMake(10, (CGRectGetHeight(self.frame)-imageviewsize)/2, imageviewsize, imageviewsize);
     [self addSubview:self.imageView1];
    
    
    
    self.firstlabel.frame=CGRectMake(CGRectGetMaxX(self.imageView1.frame)+10, 0, 100, CGRectGetHeight(self.frame));
    self.firstlabel.font=[UIFont systemFontOfSize:14];
    self.firstlabel.textAlignment=NSTextAlignmentLeft;
    [self addSubview:self.firstlabel];
    
    
    
    self.imageView2.frame=CGRectMake(CGRectGetWidth(self.frame)-10-imageviewsize, (CGRectGetHeight(self.frame)-imageviewsize)/2, imageviewsize-5, imageviewsize);
    self.imageView2.image=[UIImage imageNamed:@"icon_zcright.png"];
    [self addSubview:self.imageView2];

    
    
    self.secondlabel.frame=CGRectMake(CGRectGetWidth(self.frame)/2-imageviewsize-20,0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame));
    self.secondlabel.textAlignment=NSTextAlignmentRight;
    self.secondlabel.textColor=[UIColor grayColor];
    self.secondlabel.font=[UIFont systemFontOfSize:14];
    [self addSubview:self.secondlabel];
    
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 1)];
    view.backgroundColor=[UIColor colorWithRed:0.67 green:0.67 blue:0.67 alpha:1.00];
    [self addSubview:view];
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
