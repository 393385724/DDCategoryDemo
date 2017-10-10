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

#import "DDSafetyHeader.h"

#import <objc/runtime.h>

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
    
    NSMutableArray *array = [@[@"1"] mutableCopy];
    [array insertObject:@"2" atIndex:1];
    array[4] = @"3";
    
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    mDict[@"aa"] = nil;
    NSString *key = nil;
    mDict[key] = @"234";
    
    NSDictionary *dict = @{@"aaa":@"11212"};
    NSLog(@"%@",dict[key]);
}

- (void)labelTap:(UITapGestureRecognizer *)tap {
    NSLog(@"label tapd");
}

- (void)imageViewTap:(UITapGestureRecognizer *)tap {
    NSLog(@"imageView tapd");
}

- (IBAction)buttonAction:(id)sender {
    NSLog(@"button tapd");
}

@end
