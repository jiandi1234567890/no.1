//
//  ordersettlementTableViewCell.m
//  田字一号
//
//  Created by 张海禄 on 16/4/27.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "ordersettlementTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation ordersettlementTableViewCell
{
    //支付方式的三个按键
    UIButton *yuer,*zhifubao,*weixin;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)yuerClikc{
    yuer.selected=YES;
    zhifubao.selected=NO;
    weixin.selected=NO;
    
}

-(void)zhifubaoClikc{
    yuer.selected=NO;
    zhifubao.selected=YES;
    weixin.selected=NO;
    
}
-(void)weixinClikc{
    
    yuer.selected=NO;
    zhifubao.selected=NO;
    weixin.selected=YES;
}


-(void)setupinit{
    
    //订单结算
    UILabel *ordersettlementlabel=[[UILabel alloc]init];
     ordersettlementlabel.text=@"订单结算：";
    ordersettlementlabel.textAlignment=NSTextAlignmentLeft;
    ordersettlementlabel.font=[UIFont boldSystemFontOfSize:17];
    [self addSubview:ordersettlementlabel];
    
    UILabel *labelline1=[[UILabel alloc]init];
    labelline1.backgroundColor=[UIColor grayColor];
    [self addSubview:labelline1];
    
    
    UILabel *moneylabel1=[[UILabel alloc]init];
    moneylabel1.text=@"商品金额";
    moneylabel1.textAlignment=NSTextAlignmentLeft;
    moneylabel1.font=[UIFont systemFontOfSize:13];
    [self addSubview:moneylabel1];
    
    
    self.moneylabel2=[[UILabel alloc]init];
    self.moneylabel2.textColor=[UIColor orangeColor];
    self.moneylabel2.textAlignment=NSTextAlignmentRight;
    self.moneylabel2.font=[UIFont systemFontOfSize:13];
    [self addSubview:self.moneylabel2];
    
    
    UILabel *cutmoneylabel1=[[UILabel alloc]init];
    cutmoneylabel1.text=@"优惠券抵扣";
    cutmoneylabel1.textAlignment=NSTextAlignmentLeft;
    cutmoneylabel1.font=[UIFont systemFontOfSize:13];
    [self addSubview:cutmoneylabel1];
    
    self.cutmoneylabel2=[[UILabel alloc]init];
    self.cutmoneylabel2.textColor=[UIColor orangeColor];
    self.cutmoneylabel2.textAlignment=NSTextAlignmentRight;
    self.cutmoneylabel2.font=[UIFont systemFontOfSize:13];
    [self addSubview:self.cutmoneylabel2];
    
    
    UILabel *freightlabel1=[[UILabel alloc]init];
    freightlabel1.text=@"订单运费";
    freightlabel1.textAlignment=NSTextAlignmentLeft;
    freightlabel1.font=[UIFont systemFontOfSize:13];
    [self addSubview:freightlabel1];
    
    
    self.freightlabel2=[[UILabel alloc]init];
    self.freightlabel2.textColor=[UIColor orangeColor];
    self.freightlabel2.textAlignment=NSTextAlignmentRight;
    self.freightlabel2.font=[UIFont systemFontOfSize:13];
    [self addSubview:self.freightlabel2];
    
    
    self.allthings=[[UILabel alloc]init];
    self.allthings.font=[UIFont boldSystemFontOfSize:17];
    self.allthings.textAlignment=NSTextAlignmentRight;
    [self addSubview:self.allthings];
    
   //支付方式
    UILabel *payway=[[UILabel alloc]init];
    payway.text=@"支付方式：";
    payway.textAlignment=NSTextAlignmentLeft;
    payway.font=[UIFont boldSystemFontOfSize:17];
    [self addSubview:payway];
    
    
    UILabel *labelline2=[[UILabel alloc]init];
    labelline2.backgroundColor=[UIColor grayColor];
    [self addSubview:labelline2];

    
    yuer=[UIButton buttonWithType:UIButtonTypeCustom];
    yuer.selected=YES;
    [yuer setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    [yuer setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [yuer setTitle:@"余额支付" forState:UIControlStateNormal];
    yuer.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, -10);
    yuer.imageEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 0);
    [yuer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    yuer.titleLabel.font=[UIFont systemFontOfSize:13];
    [yuer addTarget:self action:@selector(yuerClikc) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:yuer];
    
    zhifubao=[UIButton buttonWithType:UIButtonTypeCustom];
    [zhifubao setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    [zhifubao setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [zhifubao setTitle:@"支付宝" forState:UIControlStateNormal];
    zhifubao.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, -10);
    zhifubao.imageEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 0);

    [zhifubao setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    zhifubao.titleLabel.font=[UIFont systemFontOfSize:13];
    [zhifubao addTarget:self action:@selector(zhifubaoClikc) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zhifubao];
    
    
    weixin=[UIButton buttonWithType:UIButtonTypeCustom];
    [weixin setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    [weixin setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [weixin setTitle:@"微信支付" forState:UIControlStateNormal];
    weixin.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, -10);
    weixin.imageEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 0);

    [weixin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    weixin.titleLabel.font=[UIFont systemFontOfSize:13];
    [weixin addTarget:self action:@selector(weixinClikc) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:weixin];
    
  //买家留言
    UILabel *leavewordlabel=[[UILabel alloc]init];
    leavewordlabel.text=@"买家留言：";
    leavewordlabel.textAlignment=NSTextAlignmentLeft;
    leavewordlabel.font=[UIFont boldSystemFontOfSize:17];
    [self addSubview:leavewordlabel];
    
    self.leavewordTF=[[UITextField alloc]init];
    self.leavewordTF.font=[UIFont systemFontOfSize:13];
    self.leavewordTF.placeholder=@"选填，可填写您和卖家达成一致的要求。";
    self.leavewordTF.layer.borderColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.90 alpha:1.00].CGColor;
    self.leavewordTF.layer.borderWidth=1;
    [self addSubview:self.leavewordTF];
    
    

#pragma mark  控件约束
    
    ordersettlementlabel.sd_layout
    .topSpaceToView(self,10)
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .heightIs(30);
    
    labelline1.sd_layout
    .topSpaceToView(ordersettlementlabel,10)
    .rightSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .heightIs(1);
    
  //商品金额
    moneylabel1.sd_layout
    .leftEqualToView(ordersettlementlabel)
    .topSpaceToView(labelline1,10)
    .widthIs(100)
    .heightIs(18);
    
    self.moneylabel2.sd_layout
    .leftSpaceToView(moneylabel1,10)
    .topEqualToView(moneylabel1)
    .rightSpaceToView(self,5)
    .heightIs(18);
    
   // 优惠券抵扣
    cutmoneylabel1.sd_layout
    .topSpaceToView(moneylabel1,0)
    .leftEqualToView(moneylabel1)
    .widthIs(100)
    .heightIs(18);
    
    self.cutmoneylabel2.sd_layout
    .topEqualToView(cutmoneylabel1)
    .leftSpaceToView(cutmoneylabel1,10)
    .rightSpaceToView(self,5)
    .heightIs(18);
    
    
   // 订单运费
    freightlabel1.sd_layout
    .topSpaceToView(cutmoneylabel1,0)
    .leftEqualToView(moneylabel1)
    .widthIs(100)
    .heightIs(18);
    
    self.freightlabel2.sd_layout
    .topEqualToView(freightlabel1)
    .leftSpaceToView(freightlabel1,10)
    .rightSpaceToView(self,5)
    .heightIs(18);
    
    
    //总计
     self.allthings.sd_layout
    .topSpaceToView(freightlabel1,20)
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .heightIs(30);
    
    //支付方式
    payway.sd_layout
    .topSpaceToView(self.allthings,20)
    .leftEqualToView(ordersettlementlabel)
    .rightSpaceToView(self,5)
    .heightIs(30);
    
    labelline2.sd_layout
    .topSpaceToView(payway,10)
    .rightSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .heightIs(1);
    
    yuer.sd_layout
    .topSpaceToView(labelline2,10)
    .leftEqualToView(payway)
    .widthIs(85)
    .heightIs(20);
    
    zhifubao.sd_layout
    .topEqualToView(yuer)
    .leftSpaceToView(yuer,0)
    .widthIs(75)
    .heightIs(20);
    
    weixin.sd_layout
    .topEqualToView(yuer)
    .leftSpaceToView(zhifubao,0)
    .widthIs(85)
    .heightIs(20);
    

    //买家留言
    leavewordlabel.sd_layout
    .topSpaceToView(yuer,20)
    .leftEqualToView(ordersettlementlabel)
    .rightSpaceToView(self,5)
    .heightIs(30);
    
    self.leavewordTF.sd_layout
    .topSpaceToView(leavewordlabel,0)
    .leftEqualToView(leavewordlabel)
    .rightSpaceToView(self,5)
    .heightIs(30);
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.backgroundColor=[UIColor whiteColor];
        
        [self setupinit];
        
    }
    
    return self;
    
}


@end
