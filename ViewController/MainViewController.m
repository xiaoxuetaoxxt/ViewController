//
//  MainViewController.m
//  ViewController
//
//  Created by MAC mini1 on 16/3/18.
//  Copyright © 2016年 MAC mini1. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController3.h"
#import "ViewController2.h"
#import "ViewController1.h"



@interface MainViewController ()


@property(nonatomic,strong)ViewController1 *VC1;
@property(nonatomic,strong)ViewController2 *VC2;
@property(nonatomic,strong)ViewController3 *VC3;
@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong) UIScrollView *headScrollView;
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.title = @"视图切换";
    [self setUpUI];
    
    // Do any additional setup after loading the view.
}
-(void)setUpUI{
  
    
    //向导航栏集合中添加横向按钮列表
    NSArray *buttons = [NSArray arrayWithObjects:@"直播", @"行情",@"日历",nil];
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttons];
    
    // 属性
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f]};
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    segmentedControl.frame =CGRectMake(0,64, [UIScreen mainScreen].bounds.size.width, 44);
    
    segmentedControl.tintColor = [UIColor blueColor];
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    //添加按钮响应事件
    [segmentedControl addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:segmentedControl];
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 44+64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44 - 64)];
    _contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contentView];
    
    [self addSubControllers];
    
}

#pragma mark - privatemethods
- (void)addSubControllers{
    _VC1 = [[ViewController1 alloc]init];
    _VC1.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:_VC1];
    
    _VC2 = [[ViewController2 alloc]init];
    _VC2.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:_VC2];
    
    _VC3 = [[ViewController3 alloc]init];
    _VC3.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:_VC3];
    
    //调整子视图控制器的Frame已适应容器View
    [self fitFrameForChildViewController:_VC1];
    //设置默认显示在容器View的内容
    [self.contentView addSubview:_VC1.view];
    
    NSLog(@"%@",NSStringFromCGRect(self.contentView.frame));
    NSLog(@"%@",NSStringFromCGRect(_VC1.view.frame));
    
    _currentVC = _VC1;
    
    
    
}


-(void)buttonAction:(id)sender{
    
    switch([sender selectedSegmentIndex])
    {
        case 0:
             [self fitFrameForChildViewController:_VC1];
            [self transitionFromOldViewController:_currentVC toNewViewController:_VC1];
            break;
        case 1:
            [self fitFrameForChildViewController:_VC2];
           [self transitionFromOldViewController:_currentVC toNewViewController:_VC2];
            break;
        case 2:
            [self fitFrameForChildViewController:_VC3];
             [self transitionFromOldViewController:_currentVC toNewViewController:_VC3];
            break;
        default:
            NSLog(@"ccc");
            break;
    }
}

///转换子视图控制器
- (void)transitionFromOldViewController:(UIViewController *)oldViewController toNewViewController:(UIViewController *)newViewController{
    
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            _currentVC = newViewController;
        }else{
            _currentVC = oldViewController;
        }
    }];
}

//移除所有子视图控制器
- (void)removeAllChildViewControllers{
    for (UIViewController *vc in self.childViewControllers) {
        [vc willMoveToParentViewController:nil];
        [vc removeFromParentViewController];
    }
}
- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = self.contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
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
