//
//  ViewController1.m
//  ViewController
//
//  Created by MAC mini1 on 16/3/18.
//  Copyright © 2016年 MAC mini1. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-150)/2, 200, 150, 40)];
    label.text = @"第1个ViewController";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
