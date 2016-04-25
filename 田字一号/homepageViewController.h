//
//  homepageViewController.h
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PassnumberDelegate

-(void)Passnumber:(NSInteger *)number;//1.1定义协议与方法

@end


@interface homepageViewController : UIViewController

@end
