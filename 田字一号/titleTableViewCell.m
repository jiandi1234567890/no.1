//
//  titleTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/12.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "titleTableViewCell.h"

@implementation titleTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.imageview=[[UIImageView alloc]init];
        self.headimageview=[[UIImageView alloc]init];
        self.namelabel=[[UILabel alloc]init];
        self.imagebutton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button2=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button3=[UIButton buttonWithType:UIButtonTypeCustom];
        self.label1=[[UILabel alloc]init];
         self.label2=[[UILabel alloc]init];
         self.label3=[[UILabel alloc]init];
    
    }
    
    return self;
}


-(void)layoutSubviews
{
    
    
    self.imageview.frame=CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    self.imageview.image=[UIImage imageNamed:@"bg_user.jpg"];
    
    [self addSubview:self.imageview];
    
    //聊天样式按键
    self.imagebutton.frame=CGRectMake(CGRectGetWidth(self.frame)-40, 12, 30, 25);
    [self.imagebutton setImage:[UIImage imageNamed:@"icon_xxan.png"] forState:UIControlStateNormal];
    self.imagebutton.tag=206;
    [self addSubview:self.imagebutton];
    
    
   self.headimageview.frame=CGRectMake((CGRectGetWidth(self.frame)-60)/2, 10, 60, 60);
    self.headimageview.image=[UIImage imageNamed:@"img_head.png"];
    [self.imageview addSubview:self.headimageview];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.frame)-100)/2, 8+CGRectGetMaxY(self.headimageview.frame), 100, 18)];
    label.text=@"FARMNO.1";
    label.textColor=[UIColor blackColor];
    label.font=[UIFont systemFontOfSize:15];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor clearColor];
    [self.imageview addSubview:label];
    
    //用户名
    self.namelabel.frame=CGRectMake((CGRectGetWidth(self.frame)-200)/2, 5+CGRectGetMaxY(label.frame), 200, 18);
    self.namelabel.textColor=[UIColor whiteColor];
    self.namelabel.textAlignment=NSTextAlignmentCenter;
    self.namelabel.font=[UIFont systemFontOfSize:17];
    self.namelabel.backgroundColor=[UIColor clearColor];
    [self.imageview  addSubview:self.namelabel];
    
   //商品收藏、优惠券、我的积分三个按键
    self.button1.frame=CGRectMake(0, CGRectGetHeight(self.frame)-36, CGRectGetWidth(self.frame)/3, 36);
    self.button1.backgroundColor=[UIColor colorWithRed:0.31 green:0.52 blue:0.25 alpha:0.60];
    [self.button1 setTitle:@"商品收藏" forState:UIControlStateNormal];
    self.button1.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button1.titleEdgeInsets=UIEdgeInsetsMake(0, 0, -17, 0);
    self.button1.tag=230+1;
    [self addSubview:self.button1];
    
    self.label1.frame=CGRectMake(0, 0, CGRectGetWidth(self.frame)/3, 17);
    self.label1.font=[UIFont systemFontOfSize:13];
    self.label1.textAlignment=NSTextAlignmentCenter;
    self.label1.textColor=[UIColor blackColor];
    self.label1.backgroundColor=[UIColor clearColor];
    [self.button1 addSubview:self.label1];
    
    
    
    
    
    
    self.button2.frame=CGRectMake(CGRectGetWidth(self.frame)/3, CGRectGetHeight(self.frame)-36, CGRectGetWidth(self.frame)/3, 36);
    self.button2.backgroundColor=[UIColor colorWithRed:0.31 green:0.52 blue:0.25 alpha:0.60];
    [self.button2 setTitle:@"优惠券" forState:UIControlStateNormal];
    self.button2.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button2.titleEdgeInsets=UIEdgeInsetsMake(0, 0, -17, 0);
    self.button2.tag=230+2;
    [self addSubview:self.button2];
    
    self.label2.frame=CGRectMake(0, 0, CGRectGetWidth(self.frame)/3, 17);
    self.label2.font=[UIFont systemFontOfSize:13];
    self.label2.textAlignment=NSTextAlignmentCenter;
    self.label2.textColor=[UIColor blackColor];
    self.label2.backgroundColor=[UIColor clearColor];
    [self.button2 addSubview:self.label2];

   
    
    
    
    
    self.button3.frame=CGRectMake(CGRectGetWidth(self.frame)*2/3, CGRectGetHeight(self.frame)-36, CGRectGetWidth(self.frame)/3, 36);
    self.button3.backgroundColor=[UIColor colorWithRed:0.31 green:0.52 blue:0.25 alpha:0.60];
    [self.button3 setTitle:@"我的积分" forState:UIControlStateNormal];
    self.button3.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button3.titleEdgeInsets=UIEdgeInsetsMake(0, 0, -17, 0);
    self.button3.tag=230+3;
    [self addSubview:self.button3];
    
    self.label3.frame=CGRectMake(0, 0, CGRectGetWidth(self.frame)/3, 17);
    self.label3.font=[UIFont systemFontOfSize:13];
    self.label3.textAlignment=NSTextAlignmentCenter;
    self.label3.textColor=[UIColor blackColor];
    self.label3.backgroundColor=[UIColor clearColor];
    [self.button3 addSubview:self.label3];

    //按键隔断
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/3-1, 1, 1, 34)];
    view1.backgroundColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/3-1, 1, 1, 34)];
    view2.backgroundColor=[UIColor colorWithRed:0.56 green:0.76 blue:0.20 alpha:1.00];
    [self.button1 addSubview:view1];
    [self.button2 addSubview:view2];
    
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
