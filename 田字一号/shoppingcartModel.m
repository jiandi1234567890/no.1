//
//  shoppingcartModel.m
//  田字一号
//
//  Created by 张海禄 on 16/4/14.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "shoppingcartModel.h"

@implementation shoppingcartModel


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.namestr forKey:@"namestr"];
    [aCoder encodeObject:self.pricestr forKey:@"pricestr"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.number] forKey:@"number"];
    [aCoder encodeObject:self.imagename forKey:@"image"];
    //[aCoder encodeObject:self.isSelected forKey:@"isSelected"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        
        self.namestr=[aDecoder decodeObjectForKey:@"namestr"];
        self.pricestr=[aDecoder decodeObjectForKey:@"pricestr"];
        self.number=[[aDecoder decodeObjectForKey:@"number"]integerValue];
        self.imagename=[aDecoder decodeObjectForKey:@"image"];
        
        
        
    }
    
    return self;

    
    
    
}


@end
