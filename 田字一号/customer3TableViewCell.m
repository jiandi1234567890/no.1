//
//  customer3TableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/12.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "customer3TableViewCell.h"

@implementation customer3TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button1 setImage:[UIImage imageNamed:@"icon_user_yhq.png"] forState:UIControlStateNormal];
        [ self.button1 setTitle:@"优惠券" forState:UIControlStateNormal];
        self.button2=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button2 setImage:[UIImage imageNamed:@"icon_user_jf.png"] forState:UIControlStateNormal];
        [ self.button2 setTitle:@"积分" forState:UIControlStateNormal];
        self.button3=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button3 setImage:[UIImage imageNamed:@"icon_user_ye.png"] forState:UIControlStateNormal];
        [ self.button3 setTitle:@"余额" forState:UIControlStateNormal];
        self.button4=[UIButton buttonWithType:UIButtonTypeCustom];
        [ self.button4 setImage:[UIImage imageNamed:@"icon_user_cz.png"] forState:UIControlStateNormal];
        [ self.button4 setTitle:@"充值" forState:UIControlStateNormal];
        self.label1=[[UILabel alloc]init];
        self.label2=[[UILabel alloc]init];
           }
    
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
     NSString *string1=@"  可用余额：";
     NSString *string2=@"  冻结余额：";
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(25, 8, CGRectGetWidth(self.frame)-50, 30)];
    view.backgroundColor=[UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.00];
    view.layer.borderColor=[UIColor colorWithRed:0.67 green:0.67 blue:0.67 alpha:1.00].CGColor;
    view.layer.borderWidth=1;
    view.layer.cornerRadius=8;
    view.layer.masksToBounds=YES;
    [self addSubview:view];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.frame)-50)/2, 0, 1, 30)];
    view1.backgroundColor=[UIColor colorWithRed:0.67 green:0.67 blue:0.67 alpha:1.00];
    [view addSubview:view1];
    
    self.label1.frame=CGRectMake(0, 0, (CGRectGetWidth(self.frame)-50)/2, 30);
    self.label1.backgroundColor=[UIColor clearColor];
    self.label1.font=[UIFont systemFontOfSize:13];
    self.label1.textAlignment=NSTextAlignmentLeft;
    self.label1.text=string1;
    [view addSubview:self.label1];
    
    
    self.label2.frame=CGRectMake((CGRectGetWidth(self.frame)-50)/2, 0, (CGRectGetWidth(self.frame)-50)/2, 30);
    self.label2.backgroundColor=[UIColor clearColor];
    self.label2.font=[UIFont systemFontOfSize:13];
    self.label2.text=string2;
    [view  addSubview:self.label2];
    
    
    self.button1.frame=CGRectMake(0, 33, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)-33);
    [ self.button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button1.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button1.titleEdgeInsets=UIEdgeInsetsMake(self.button1.imageView.bounds.size.height,-self.button1.imageView.intrinsicContentSize.width,0,0);
    self.button1.imageEdgeInsets=UIEdgeInsetsMake(8+33,CGRectGetWidth(self.frame)*11/120,self.button1.titleLabel.bounds.size.height+8+33,CGRectGetWidth(self.frame)*11/120);
    self.button1.tag=210+1;
    
    [self addSubview: self.button1];
    
    
    
    self.button2.frame=CGRectMake(CGRectGetWidth(self.frame)/4, 33, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)-33);
    [ self.button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button2.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button2.titleEdgeInsets=UIEdgeInsetsMake(self.button2.imageView.bounds.size.height,-self.button2.imageView.intrinsicContentSize.width,0,0);
    self.button2.imageEdgeInsets=UIEdgeInsetsMake(8+33,CGRectGetWidth(self.frame)*11/120,self.button2.titleLabel.bounds.size.height+8+33,CGRectGetWidth(self.frame)*11/120);
    self.button2.tag=210+2;
    
    [self addSubview: self.button2];
    
    
    
    self.button3.frame=CGRectMake( CGRectGetWidth(self.frame)*2/4, 33, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)-33);
    [ self.button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button3.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button3.titleEdgeInsets=UIEdgeInsetsMake(self.button3.imageView.bounds.size.height,-self.button3.imageView.intrinsicContentSize.width,0,0);
    self.button3.imageEdgeInsets=UIEdgeInsetsMake(8+33,CGRectGetWidth(self.frame)*11/120,self.button3.titleLabel.bounds.size.height+8+33,CGRectGetWidth(self.frame)*11/120);
    self.button3.tag=210+3;
    
    [self addSubview: self.button3];
    
    
    
    self.button4.frame=CGRectMake( CGRectGetWidth(self.frame)*3/4, 33, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)-33);
    [ self.button4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.button4.titleLabel.font=[UIFont systemFontOfSize:14];
    self.button4.titleEdgeInsets=UIEdgeInsetsMake(self.button4.imageView.bounds.size.height,-self.button4.imageView.intrinsicContentSize.width,0,0);
    self.button4.imageEdgeInsets=UIEdgeInsetsMake(8+33,CGRectGetWidth(self.frame)*11/120,self.button4.titleLabel.bounds.size.height+8+33,CGRectGetWidth(self.frame)*11/120);
    self.button4.tag=210+4;
    
    [self addSubview: self.button4];

    
    
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
