//
//  DetailViewController.h
//  ViewController
//
//  Created by MAC mini1 on 16/3/18.
//  Copyright © 2016年 MAC mini1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

