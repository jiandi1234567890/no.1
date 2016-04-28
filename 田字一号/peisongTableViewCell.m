//
//  peisongTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/27.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "peisongTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation peisongTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)button1Click{
    
    self.button1.backgroundColor=[UIColor orangeColor];
    self.button2.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
     self.button3.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
}

-(void)button2Click{
     self.button1.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
     self.button2.backgroundColor=[UIColor orangeColor];
     self.button3.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
}

-(void)button3Click{
     self.button1.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
     self.button2.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
     self.button3.backgroundColor=[UIColor orangeColor];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.backgroundColor=[UIColor whiteColor];
       
        UILabel *label1=[[UILabel alloc]init];
        label1.text=@"配送方式:";
        label1.font=[UIFont boldSystemFontOfSize:17];
        [self addSubview:label1];
      
        //尽快配送按键
        self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.button1 setTitle:@"尽快配送" forState:UIControlStateNormal];
        [self.button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.button1.titleLabel.font=[UIFont systemFontOfSize:13];
        self.button1.layer.cornerRadius=5;
        self.button1.layer.masksToBounds=YES;
        self.button1.backgroundColor=[UIColor orangeColor];
        [self.button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button1];
        
       // 限时配送按键
        self.button2=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.button2 setTitle:@"限时配送" forState:UIControlStateNormal];
        [self.button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.button2.titleLabel.font=[UIFont systemFontOfSize:13];
        self.button2.layer.cornerRadius=5;
        self.button2.layer.masksToBounds=YES;
        self.button2.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
         [self.button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button2];
        
        //自提减一元按键
        self.button3=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.button3 setTitle:@"自提减一元" forState:UIControlStateNormal];
        [self.button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.button3.titleLabel.font=[UIFont systemFontOfSize:13];
        self.button3.layer.cornerRadius=5;
        self.button3.layer.masksToBounds=YES;
        self.button3.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
         [self.button3 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button3];
        
        
        UILabel *labelline=[[UILabel alloc]init];
        labelline.backgroundColor=[UIColor grayColor];
        [self addSubview:labelline];
        
        
        UILabel *label2=[[UILabel alloc]init];
        label2.text=@"优惠券：";
        label2.font=[UIFont systemFontOfSize:14];
        [self addSubview:label2];

       //优惠券选择按键
        self.button4=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button4.layer.borderWidth=1;
        self.button4.layer.borderColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.90 alpha:1.00].CGColor;
        [self.button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button4 setTitle:@"  请选择优惠券" forState:UIControlStateNormal];
        self.button4.titleLabel.font=[UIFont systemFontOfSize:14];
        self.button4.titleLabel.textAlignment=NSTextAlignmentLeft;
        [self addSubview:self.button4];
        
       
      
        
        
        label1.sd_layout
        .leftSpaceToView(self,5)
        .topSpaceToView(self,20)
        .heightIs(30)
        .widthIs(80);
        
        
        self.button1.sd_layout
        .topEqualToView(label1)
        .leftSpaceToView(label1,0)
        .heightIs(30)
        .widthIs(70);
        
        self.button2.sd_layout
        .topEqualToView(label1)
        .leftSpaceToView(self.button1,5)
        .heightIs(30)
        .widthIs(70);
        
        
        self.button3.sd_layout
        .topEqualToView(label1)
        .leftSpaceToView(self.button2,5)
        .heightIs(30)
        .widthIs(78);
        
        
        
        labelline.sd_layout
        .topSpaceToView(self.button3,10)
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .heightIs(1);
        
        label2.sd_layout
        .topSpaceToView(labelline,5)
        .leftSpaceToView(self,5)
        .widthIs(70)
        .heightIs(30);
        
        self.button4.sd_layout
        .topEqualToView(label2)
        .leftSpaceToView(label2,2)
        .rightSpaceToView(self,80)
        .heightIs(30);
        
    }
    return self;
}


@end
