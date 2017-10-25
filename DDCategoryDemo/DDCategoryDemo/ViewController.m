//
//  ViewController.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "ViewController.h"
#import "DDHitEdgeInsetsHeader.h"
#import "DDCoreHeader.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.ddHitEdgeInsets = UIEdgeInsetsMake(-50, -50, -50, -50);
    self.button.ddHitEdgeInsets = UIEdgeInsetsMake(-50, -50, -50, -50);
    self.imageView.ddHitEdgeInsets = UIEdgeInsetsMake(-50, -50, -50, -50);
    
    [self.imageView dd_addTarget:self tapAction:@selector(imageViewTap:)];
    [self.label dd_addTarget:self tapAction:@selector(labelTap:)];
    
//    NSArray *array = @[@"1",@"2"];
//    array[3];
//    [array objectAtIndex:4];
//
//    NSMutableArray *mArray = [@[@"1"] mutableCopy];
//    [mArray insertObject:@"2" atIndex:1];
//    mArray[4] = @"3";
//    mArray[10];
//
//    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] initWithCapacity:0];
//    mDict[@"aa"] = nil;
//    NSString *key = nil;
//    mDict[key] = @"234";
//
//    NSDictionary *dict = @{@"aaa":@"11212"};
//    [dict objectForKey:key];
//    NSLog(@"%@",dict[key]);
}

- (void)labelTap:(UITapGestureRecognizer *)tap {
    NSLog(@"label tapd");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.imageView.backgroundColor = [UIColor redColor];
    });
}

- (void)imageViewTap:(UITapGestureRecognizer *)tap {
    [self.imageView performSelector:@selector(setText:) withObject:@"111111"];
    NSLog(@"imageView tapd");
}

- (IBAction)buttonAction:(id)sender {
    NSLog(@"button tapd");
}

@end
