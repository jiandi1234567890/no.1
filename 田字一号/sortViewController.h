//
//  sortViewController.h
//  田字一号
//
//  Created by 张海禄 on 16/3/28.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sortViewController : UIViewController
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) UICollectionView * collectionview;
@property(nonatomic)  NSInteger leftviewnumber;
@property(nonatomic)  NSInteger homepastnumber;

@end
