//
//  SeconViewController.m
//  ViewSlideDemo
//
//  Created by Aman Gangurde on 25/04/16.
//  Copyright © 2016 KloudData Inc. All rights reserved.
//

#import "SeconViewController.h"
#import "UIView+Autolayout.h"

@interface SeconViewController ()
{
  UIView *navigationBarView;
  BaseViewController *baseObj;
}
@end

@implementation SeconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  navigationBarView = [self setUpnavigationController];
  self.view.backgroundColor = [UIColor lightGrayColor];
  
}

-(void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
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
