//
//  YZTableViewController.m
//  YZHeaderScaleImageDemo
//
//  Created by yz on 16/7/29.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTableViewController.h"
#import "UIScrollView+HeaderScaleImage.h"
static NSString * const ID = @"cell";

static CGFloat const imageViewH = 200;

@interface YZTableViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation YZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
#pragma mark - 方法一
    // 设置tableView头部缩放图片
//    self.tableView.yz_headerScaleImage = [UIImage imageNamed:@"header"];
//    
//    // 设置tableView头部视图，必须设置头部视图背景颜色为clearColor,否则会被挡住
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
//    headerView.backgroundColor = [UIColor clearColor];
//    self.tableView.tableHeaderView = headerView;
//    
#pragma mark - 方法二（与方法一原理一样,写法不一样而已）
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, imageViewH);
    [self.tableView insertSubview:imageView atIndex:0];
    self.imageView = imageView;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, imageViewH)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    
    NSString *text = nil;
    switch (indexPath.row) {
        case 0:
        {
            text = @"MacOS";
            break;
        }
        case 1:
        {
            text = @"Android";
            break;
        }
        case 2:
        {
            text = @"iOS";
            break;
        }

        default:
            break;
    }

    cell.textLabel.text = text;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY < 0) {
//        self.imageView.frame = CGRectMake(offsetY, offsetY, scrollView.bounds.size.width - offsetY * 2, imageViewH - offsetY);
//    } else {
//        self.imageView.frame = CGRectMake(0, 0, scrollView.bounds.size.width, imageViewH);
//    }
    
#pragma mark - 方法三 运用CGAffineTransformMakeScale使imageview缩放
    CGFloat offsetY = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    CGFloat scale = 1.0;
    
    if (offsetY < 0) {
        //向下拉
        scale = MIN(2.5, 1 - offsetY / imageViewH);
        self.imageView.transform = CGAffineTransformMakeScale(scale, scale);
        CGRect frame = self.imageView.frame;
        frame.origin.y = offsetY;
        self.imageView.frame = frame;
    }else if(offsetY > 0)
    {
        CGRect frame = self.imageView.frame;
        frame.origin.y = -offsetY/imageViewH;
        self.imageView.frame = frame;
    }
 
}

@end
