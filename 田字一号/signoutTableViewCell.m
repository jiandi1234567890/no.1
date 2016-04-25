//
//  signoutTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/12.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "signoutTableViewCell.h"

@implementation signoutTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.signoutview=[[UIView alloc]init];
        self.label=[[UILabel alloc]init];
    }
    
    return  self;
    
}


-(void)layoutSubviews
{
    
    self.signoutview.frame=CGRectMake(10,0, CGRectGetWidth(self.frame)-20, 40);
    self.signoutview.layer.cornerRadius=6;
   self.signoutview.layer.masksToBounds=YES;
    [self addSubview:self.signoutview];
    
    self.label.frame=CGRectMake(0, 0, CGRectGetWidth(self.signoutview.frame), 40);
    self.label.text=@"退出账号";
    self.label.textAlignment=NSTextAlignmentCenter;
    self.label.textColor=[UIColor whiteColor];
     self.label.font=[UIFont systemFontOfSize:15];
    self.label.backgroundColor=[UIColor redColor];
    [self.signoutview addSubview:self.label];
    
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
