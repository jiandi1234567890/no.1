//
//  addressTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/25.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "addressTableViewCell.h"
#import "UIView+SDAutoLayout.h"



@implementation addressTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        self.backgroundColor=[UIColor whiteColor];
        self.name=[[UILabel alloc]init];
        self.name.textAlignment=NSTextAlignmentLeft;
        [self addSubview:self.name];
        
        self.phonenumber=[[UILabel alloc]init];
        self.phonenumber.textAlignment=NSTextAlignmentRight;
        [self addSubview:self.phonenumber];
        
        self.address=[[UILabel alloc]init];
        self.address.textAlignment=NSTextAlignmentLeft;
        self.address.font=[UIFont systemFontOfSize:14];
        [self addSubview:self.address];
        
       self.imageview=[[UIImageView alloc]init];
        self.imageview.image=[UIImage imageNamed:@"icon_dzmore.png"];
        [self addSubview:self.imageview];
        
       
        
           [self.contentView sd_addSubviews:@[self.name,self.phonenumber,self.address,self.imageview]];
        
        
        
        self.imageview.sd_layout
        .widthIs(12)
        .rightSpaceToView(self.contentView,10)
        .topSpaceToView(self.contentView,15 )
        .bottomSpaceToView(self.contentView,15);
        
        
        self.phonenumber.sd_layout
        .topSpaceToView(self.contentView,0)
        .rightSpaceToView(self.imageview,5)
        .widthIs(120)
        .heightIs(30);
        
        self.name.sd_layout
        .topSpaceToView(self.contentView,0)
        .leftSpaceToView(self.contentView,10)
        .rightSpaceToView(self.phonenumber,0)
        .heightIs(30);
        
        
        self.address.sd_layout
        .topSpaceToView(self.name,0)
        .leftSpaceToView(self.contentView,10)
        .rightSpaceToView(self.imageview,5)
        .heightIs(24);

        
       
        
       

    }
   
    
    return self;
}



-(void)loadDataWithModel:(addressModel *)model{
    
    
    NSString *string=[NSString stringWithFormat:@"%@%@",model.address,model.addressmore];
    self.name.text=model.name;
    self.phonenumber.text=model.phonenumber;
    self.address.text=string;
    
    
}

@end
