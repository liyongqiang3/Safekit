//
//  ViewController.m
//  TYSafeKitDemo
//
//  Created by yongqiang li on 2018/10/31.
//  Copyright © 2018 yongqiang. All rights reserved.
//

#import "ViewController.h"
#import "Foundation+SafeKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArray];
    [self testMutableArray];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)testArray
{
    NSArray *array1 = @[@"1",@"2",@"3"];
    NSString *str =  array1[4];
    NSString *str1 =  [array1 objectAtIndex:4];
    NSLog(@"%@------%@-",str,str1);
}
- (void)testMutableArray
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    [mutableArray addObject:nil];
    [mutableArray addObject:@"1"];
    [mutableArray addObject:@"2"];

    NSString *str =  mutableArray[4];
    NSString *str1 =  [mutableArray objectAtIndex:4];
    NSLog(@"%@------%@-",str,str1);
}

@end
