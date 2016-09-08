//
//  AnimationCell.m
//  表的Header
//
//  Created by lx on 16/9/8.
//  Copyright © 2016年 lixun. All rights reserved.
//

#import "AnimationCell.h"
#import "UIView+Extension.h"
@interface AnimationCell ()

@end

@implementation AnimationCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, self.center.y - 15, 150, 30)];
        [self addSubview:self.titleLabel];
    }
    return self;
}


- (void)show{
   [UIView animateWithDuration:0.5 animations:^{
       self.titleLabel.x = 14; 
   }];
   
}

- (void)hide{
    [UIView animateWithDuration:0.5 animations:^{
        self.titleLabel.x = 14 + 16; 
    }];
    
}

@end
