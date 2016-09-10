//
//  WYLResponseLabel.h
//  testDemo
//
//  Created by ycd15 on 16/9/10.
//  Copyright © 2016年 YCD_WYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLResponseLabel : UILabel

@property (nonatomic, strong) NSMutableArray * menuItems;

- (void)attachTapHandle;

- (void)addTitle:(NSString *)title action:(SEL)action;

@end
