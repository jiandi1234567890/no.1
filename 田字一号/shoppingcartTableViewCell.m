//
//  shoppingcartTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/14.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "shoppingcartTableViewCell.h"

#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface shoppingcartTableViewCell ()

@end

@implementation shoppingcartTableViewCell

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
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor=[UIColor whiteColor];
        [self setupmainview];
    }
    
    return self;
    
}
-(void)Selectbutton:(UIButton *)button{
    

    button.selected = !button.selected;
    if (self.cartBlock) {
        
        self.cartBlock(button.selected);
        
    }

    
}



-(void)addnumberbutton
{
    if(self.addnumber){
        self.addnumber();
    }
}

-(void)cutnumberbutton
{
    if(self.cutnumber){
        self.cutnumber();
    }
}

-(void)deletebuttonClick
{
    if(self.deletecell){
        self.deletecell();
    }
}

-(void)loaddataWith:(shoppingcartModel *)model
{
    self.imageview.image=model.image;
    self.pricelabel.text=[NSString stringWithFormat:@"¥ 23.00\nX %ld",(long)model.number];
    self.numlabel.text=[NSString stringWithFormat:@"%ld",(long)model.number];
    self.namelabel.text=model.namestr;
    
   self.selectbutton.selected=self.isSelected;
    
    
    
}


-(void) setupmainview
{
    
    //选中按键
    self.selectbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.selectbutton.selected=self.isSelected;
    [self.selectbutton setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    [self.selectbutton setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [self.selectbutton addTarget:self   action:@selector(Selectbutton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectbutton];
    
    //图片
    self.imageview=[[UIImageView alloc]init];
    self.imageview.contentMode=UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageview];
    
    //价格
    self.namelabel=[[UILabel alloc]init];
    self.namelabel.backgroundColor=[UIColor whiteColor];
    self.namelabel.textColor=[UIColor blackColor];
    self.namelabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:self.namelabel];
    
    
    //数量减按键
    self.cutnumbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.cutnumbutton setBackgroundImage:[UIImage imageNamed:@"sljian.jpg"] forState:UIControlStateNormal];
    self.cutnumbutton.layer.borderColor=[UIColor grayColor].CGColor;
    self.cutnumbutton.layer.borderWidth=1;
    [self.cutnumbutton addTarget:self  action:@selector(cutnumberbutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cutnumbutton];
    
    //数量
    self.numlabel=[[UILabel alloc]init];
    self.numlabel.backgroundColor=[UIColor whiteColor];
    self.numlabel.layer.borderColor=[UIColor grayColor].CGColor;
    self.numlabel.layer.borderWidth=1;
    self.numlabel.textAlignment=NSTextAlignmentCenter;
    self.numlabel.font=[UIFont systemFontOfSize:13];
    [self addSubview:self.numlabel];
    
    
    //数量加按键
    self.addnumbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.addnumbutton setBackgroundImage:[UIImage imageNamed:@"sljia.jpg"] forState:UIControlStateNormal];
    
    self.addnumbutton.layer.borderColor=[UIColor grayColor].CGColor;
    self.addnumbutton.layer.borderWidth=1;
    [self.addnumbutton addTarget:self action:@selector(addnumberbutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addnumbutton];
    
    
    //价格
    self.pricelabel=[[UILabel alloc]init];
    self.pricelabel.backgroundColor=[UIColor whiteColor];
    self.pricelabel.font=[UIFont systemFontOfSize:15];
    self.pricelabel.textAlignment=NSTextAlignmentRight;
    self.pricelabel.numberOfLines=0;
    [self addSubview:self.pricelabel];
    
    
    
    //删除按键
    self.deletebutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.deletebutton setTitle:@"删除" forState:UIControlStateNormal];
    self.deletebutton.titleLabel.font=[UIFont systemFontOfSize:14];
    self.deletebutton.backgroundColor=[UIColor orangeColor];
    [self.deletebutton addTarget:self action:@selector(deletebuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.deletebutton];
    
   
    UILabel *label=[UILabel new];
    label.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    [self addSubview:label];

    
    //添加约束
    
    
    [self.contentView sd_addSubviews:@[self.selectbutton,self.imageview,self.namelabel,self.cutnumbutton,self.numlabel,self.addnumbutton,self.pricelabel,self.deletebutton]];

    
    label.sd_layout
    .topSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(10);
    
    self.contentView.sd_layout
    .topSpaceToView(label,0);
    
    
    
    
   //选中按键
    self.selectbutton.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView,10)
    .widthIs(20)
    .heightIs(20);
    
    
    //图片
    self.imageview.sd_layout
    .topSpaceToView(self.contentView,5)
    .bottomSpaceToView(self.contentView,5)
    .leftSpaceToView(self.selectbutton,10)
    .widthEqualToHeight();
    
    
    //名称
    self.namelabel.sd_layout
    .topEqualToView(self.imageview)
    .leftSpaceToView(self.imageview,5)
    .widthIs(100)
    .heightIs(50);
    
    //
    //数量减按键
    self.cutnumbutton.sd_layout
    .bottomEqualToView(self.imageview)
    .leftEqualToView(self.namelabel)
    .widthIs(25)
    .heightIs(25);
    
    
    
    //数量label
    
    self.numlabel.sd_layout
    .bottomEqualToView(self.cutnumbutton)
    .leftSpaceToView(self.cutnumbutton,0)
    .widthIs(30)
    .heightIs(25);
    
    //数量加按键
    self.addnumbutton.sd_layout
    .bottomEqualToView(self.numlabel)
    .leftSpaceToView(self.numlabel,0)
    .widthIs(25)
    .heightIs(25);
    
    //价格label
    
    self.pricelabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topEqualToView(self.imageview)
    .widthIs(60)
    .heightIs(60);
    
    
    //删除按键
    
    self.deletebutton.sd_layout
    .bottomEqualToView(self.addnumbutton)
    .rightEqualToView(self.pricelabel)
    .widthIs(35)
    .heightIs(25);
    
    
    
   [self setupAutoHeightWithBottomView:self.deletebutton bottomMargin:0];
    
    
}







@end
