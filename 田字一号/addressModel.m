//
//  addressModel.m
//  田字一号
//
//  Created by 张海禄 on 16/4/25.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "addressModel.h"

@implementation addressModel

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.addressmore forKey:@"addressmore"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phonenumber forKey:@"phonenumber"];
    [aCoder encodeObject:self.postcode forKey:@"postcode"];
    
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if(self=[super init]){
        
        self.address=[aDecoder decodeObjectForKey:@"address"];
        self.addressmore=[aDecoder decodeObjectForKey:@"addressmore"];
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.phonenumber=[aDecoder decodeObjectForKey:@"phonenumber"];
        self.postcode=[aDecoder decodeObjectForKey:@"postcode"];
        
        
    }
    
    return self;
}

-(BOOL)isEqualToaddress:(addressModel *)model{
    
    if(!model){
        return NO;
    }
   
    BOOL address=(!self.address&&!model.address)||[self.address isEqualToString:model.address];
    BOOL addressmore=(!self.addressmore&&!model.addressmore)||[self.addressmore isEqualToString:model.addressmore];
    BOOL name=(!self.name&&!model.name)||[self.name isEqualToString:model.name];
    BOOL phonenumber=(!self.phonenumber&&!model.phonenumber)||[self.phonenumber isEqualToString:model.phonenumber];
    BOOL postcode=(!self.postcode&&!model.postcode)||[self.postcode isEqualToString:model.postcode];
    
    return address&&addressmore&&name&&phonenumber&postcode;
}

@end
