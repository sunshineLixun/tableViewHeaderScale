//
//  AnimationCell.h
//  表的Header
//
//  Created by lx on 16/9/8.
//  Copyright © 2016年 lixun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCell : UITableViewCell
@property (strong, nonatomic) UILabel *titleLabel;
- (void)show;
- (void)hide;

@end
