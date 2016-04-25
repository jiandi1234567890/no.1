//
//  addressModel.h
//  田字一号
//
//  Created by 张海禄 on 16/4/25.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface addressModel : NSObject<NSCoding>
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString * addressmore;
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * phonenumber;
@property(nonatomic,strong) NSString * postcode;
- (BOOL)isEqualToaddress:(addressModel *)model;
@end
