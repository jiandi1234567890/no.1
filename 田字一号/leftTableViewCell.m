//
//  leftTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/3/31.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "leftTableViewCell.h"

#define imagesize 18
#define labelfont 15
#define whitehight 3

@implementation leftTableViewCell



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    if(self)
            {
                
                
                self.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
                self.view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), whitehight)];
                self.view.backgroundColor=[UIColor whiteColor];
                [self addSubview:self.view];
                self.imageviewleft=[[UIImageView alloc]initWithFrame:CGRectMake(5, (CGRectGetHeight(self.frame)-whitehight)/2-imagesize/2, imagesize, imagesize)];
        
                [self addSubview:self.imageviewleft];
                self.labelleft=[[UILabel alloc]initWithFrame:CGRectMake(5+imagesize+2, 0, CGRectGetWidth(self.frame)-(5+imagesize+2), CGRectGetMaxY(self.frame)-whitehight)];
                self.labelleft.textAlignment=NSTextAlignmentLeft;
                self.labelleft.font=[UIFont systemFontOfSize:labelfont];
                [self addSubview:self.labelleft];
                
                
                               
            }

    
    return self;
    
}





//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//
@end
