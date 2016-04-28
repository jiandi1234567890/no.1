//
//  myorderTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "myorderTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation myorderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.numberoforder=[[UILabel alloc]init];
        self.numberoforder.textAlignment=NSTextAlignmentLeft;
        [self addSubview:self.numberoforder];
        
        
        self.orderstate=[[UILabel alloc]init];
        self.orderstate.textColor=[UIColor orangeColor];
        self.orderstate.textAlignment=NSTextAlignmentRight;
        [self addSubview:self.orderstate];
        
        UILabel *labelline1=[[UILabel alloc]init];
        labelline1.backgroundColor=[UIColor grayColor];
        
        self.imageview=[[UIImageView alloc]init];
        [self addSubview:self.imageview];
        
        self.name=[[UILabel alloc]init];
        self.name.textAlignment=NSTextAlignmentLeft;
        [self addSubview:self.name];
        
        
        self.price=[[UILabel alloc]init];
        self.price.textAlignment=NSTextAlignmentRight;
        self.price.textColor=[UIColor orangeColor];
        [self addSubview:self.price];
        
        
        UILabel *labelline2=[[UILabel alloc]init];
        labelline2.backgroundColor=[UIColor grayColor];

        self.allmoney=[[UILabel alloc]init];
        self.allmoney.textAlignment=NSTextAlignmentRight;
        [self addSubview:self.allmoney];
        
        UILabel *labelline3=[[UILabel alloc]init];
        labelline3.backgroundColor=[UIColor grayColor];

        self.orderblank=[[UILabel alloc]init];
        self.orderblank.layer.borderColor=[UIColor grayColor].CGColor;
        self.orderblank.layer.borderWidth=1;
        self.orderblank.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.orderblank];
        
        
        self.cancel=[UIButton buttonWithType:UIButtonTypeCustom];
        self.cancel.layer.borderColor=[UIColor grayColor].CGColor;
        self.cancel.layer.borderWidth=1;
        [self addSubview:self.cancel];
        
        
       //控件约束
        self.orderstate.sd_layout
        .topSpaceToView(self,0)
        .rightSpaceToView(self,5)
        .widthIs(70)
        .heightIs(45);
        
        
        self.numberoforder.sd_layout
        .topEqualToView(self.orderstate)
        .rightSpaceToView(self.orderstate,0)
        .leftSpaceToView(self,5)
        .heightIs(45);
        
        
        labelline1.sd_layout
        .topSpaceToView(self.numberoforder,0)
        .rightSpaceToView(self,0)
        .leftSpaceToView(self,0)
        .heightIs(1);
        
        
        self.imageview.sd_layout
        .topSpaceToView(labelline1,5)
        .leftSpaceToView(self,5)
        .heightIs(50)
        .widthIs(60);
        
        
        self.name.sd_layout
        .topSpaceToView(labelline1,5)
        .leftSpaceToView(self.imageview,5)
        .widthIs(150)
        .heightIs(30);
        
        
        self.price.sd_layout
        .topSpaceToView(labelline1,5)
        .leftSpaceToView(self.name,0)
        .rightSpaceToView(self,5)
        .heightIs(50);
        
        
        labelline2.sd_layout
        .topSpaceToView(self.imageview,5)
        .rightSpaceToView(self,0)
        .leftSpaceToView(self,0)
        .heightIs(1);
        
        
        self.allmoney.sd_layout
        .topSpaceToView(labelline2,0)
        .rightSpaceToView(self,0)
        .leftSpaceToView(self,0)
        .heightIs(45);
        
        
        labelline3.sd_layout
        .topSpaceToView(self.allmoney,0)
        .rightSpaceToView(self,0)
        .leftSpaceToView(self,0)
        .heightIs(1);
        
        
        
        
        
        
    }
    
    
    return self;
    
    
    
}



@end
