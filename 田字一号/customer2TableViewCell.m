//
//  customer2TableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/11.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "customer2TableViewCell.h"

@implementation customer2TableViewCell

{
   
    float width,height;
}






//自定义cell中的元素要在这里进行初始化
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
    
         self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button1 setImage:[UIImage imageNamed:@"icon_user_dph.png"] forState:UIControlStateNormal];
        [ self.button1 setTitle:@"待配货" forState:UIControlStateNormal];

         self.button2=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button2 setImage:[UIImage imageNamed:@"icon_user_dzt.png"] forState:UIControlStateNormal];
        [ self.button2 setTitle:@"待自提" forState:UIControlStateNormal];
        
         self.button3=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button3 setImage:[UIImage imageNamed:@"icon_user_dsh.png"] forState:UIControlStateNormal];
        [ self.button3 setTitle:@"待收货" forState:UIControlStateNormal];
        
         self.button4=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button4 setImage:[UIImage imageNamed:@"icon_user_dpj.png"] forState:UIControlStateNormal];
        [ self.button4 setTitle:@"待评价" forState:UIControlStateNormal];

        
         self.button5=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button5 setImage:[UIImage imageNamed:@"icon_user_tksh.png"] forState:UIControlStateNormal];
        [ self.button5 setTitle:@"退款/售后" forState:UIControlStateNormal];
        
        
        
    }
    return self;
    
    
}



//在这里进行元素的详细设置
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.button1.frame=CGRectMake(0, 0, CGRectGetWidth(self.frame)/5, CGRectGetHeight(self.frame));
    [ self.button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button1.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button1.titleEdgeInsets=UIEdgeInsetsMake(self.button1.imageView.bounds.size.height,-self.button1.imageView.intrinsicContentSize.width,0,0);
    self.button1.imageEdgeInsets=UIEdgeInsetsMake(8,CGRectGetWidth(self.frame)/15,self.button1.titleLabel.bounds.size.height+8,CGRectGetWidth(self.frame)/15);
    self.button1.tag=200+1;
    
    [self addSubview: self.button1];
    
    
    
    
    self.button2.frame=CGRectMake(CGRectGetWidth(self.frame)/5*1, 0, CGRectGetWidth(self.frame)/5, CGRectGetHeight(self.frame));
    
    [ self.button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button2.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button2.titleEdgeInsets=UIEdgeInsetsMake(self.button2.imageView.bounds.size.height,-self.button2.imageView.intrinsicContentSize.width,0,0);
    self.button2.imageEdgeInsets=UIEdgeInsetsMake(8,CGRectGetWidth(self.frame)/15,self.button2.titleLabel.bounds.size.height+8,CGRectGetWidth(self.frame)/15);
    self.button2.tag=200+2;
    [self addSubview: self.button2];
    
    
    
    
    self.button3.frame=CGRectMake(CGRectGetWidth(self.frame)/5*2, 0, CGRectGetWidth(self.frame)/5, CGRectGetHeight(self.frame));
    
    [ self.button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button3.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button3.titleEdgeInsets=UIEdgeInsetsMake(self.button3.imageView.bounds.size.height,-self.button3.imageView.intrinsicContentSize.width,0,0);
    self.button3.imageEdgeInsets=UIEdgeInsetsMake(8,CGRectGetWidth(self.frame)/15,self.button3.titleLabel.bounds.size.height+8,CGRectGetWidth(self.frame)/15);
    self.button3.tag=200+3;
    [self addSubview: self.button3];
    
    
    
    self.button4.frame=CGRectMake(CGRectGetWidth(self.frame)/5*3, 0, CGRectGetWidth(self.frame)/5, CGRectGetHeight(self.frame));
        [ self.button4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button4.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button4.titleEdgeInsets=UIEdgeInsetsMake(self.button4.imageView.bounds.size.height,-self.button4.imageView.intrinsicContentSize.width,0,0);
    self.button4.imageEdgeInsets=UIEdgeInsetsMake(8,CGRectGetWidth(self.frame)/15,self.button4.titleLabel.bounds.size.height+8,CGRectGetWidth(self.frame)/15);
    self.button4.tag=200+4;
    [self addSubview: self.button4];
    
    
    
    
    self.button5.frame=CGRectMake(CGRectGetWidth(self.frame)/5*4, 0, CGRectGetWidth(self.frame)/5, CGRectGetHeight(self.frame));
    [ self.button5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button5.titleLabel.font=[UIFont systemFontOfSize:14];
    
    self.button5.titleEdgeInsets=UIEdgeInsetsMake(self.button5.imageView.bounds.size.height,-self.button5.imageView.intrinsicContentSize.width,0,0);
    self.button5.imageEdgeInsets=UIEdgeInsetsMake(8,CGRectGetWidth(self.frame)/15,self.button5.titleLabel.bounds.size.height+8,CGRectGetWidth(self.frame)/15);
    self.button5.tag=200+5;
       [self addSubview: self.button5];
    
    
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
