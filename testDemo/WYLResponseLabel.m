//
//  WYLResponseLabel.m
//  testDemo
//
//  Created by ycd15 on 16/9/10.
//  Copyright © 2016年 YCD_WYL. All rights reserved.
//

#import "WYLResponseLabel.h"


#define SelectedColor [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0]

@implementation WYLResponseLabel

{
    UIColor * _fontBackColor;
}

- (void)attachTapHandle {
    _fontBackColor = self.backgroundColor;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];
    
    UIMenuItem * copyLink = [self createMenuItem:@"复制" action:@selector(copyAction:)];
    [self.menuItems addObject:copyLink];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillHiden:) name:UIMenuControllerWillShowMenuNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillHiden:) name:UIMenuControllerWillHideMenuNotification object:nil];
}
- (void)tapAction:(UITapGestureRecognizer *)recoginzer {
    [self becomeFirstResponder];
    [self menuUpdate];
    
    self.backgroundColor = SelectedColor;
}


- (void)addTitle:(NSString *)title action:(SEL)action {
    UIMenuItem * actionLink = [UIMenuItem.alloc initWithTitle:title action:action];
    [self.menuItems addObject:actionLink];
    [self menuUpdate];
    [self canPerformAction:action withSender:actionLink];
}



- (void)menuUpdate {
    UIMenuController * menu = [UIMenuController sharedMenuController];
    [menu setMenuItems:self.menuItems];
    
    if ([NSStringFromCGRect(self.frame) isEqualToString:NSStringFromCGRect(CGRectZero)]) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
    
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];
    //[menu update];
}

- (UIMenuItem *)createMenuItem:(NSString *)title action:(SEL)action {
    return [UIMenuItem.alloc initWithTitle:title action:action];
}

#pragma mark -menu will show/hiden-
- (void)menuWillShow:(id)menu {
    
}

- (void)menuWillHiden:(id)menu {
    self.backgroundColor = _fontBackColor;
}

#pragma mark -复制剪贴板-

- (void)copyAction:(id)sender {
    UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = self.text;
}



- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return action == @selector(copyAction:);
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}




- (NSMutableArray *)menuItems {
    if (!_menuItems) {
        _menuItems = [NSMutableArray array];
    }
    return _menuItems;
}

@end
