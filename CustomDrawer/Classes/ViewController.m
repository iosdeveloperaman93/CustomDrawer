//
//  ViewController.m
//  ViewSlideDemo
//
//  Created by Aman Gangurde on 25/04/16.
//  Copyright © 2016 KloudData Inc. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Autolayout.h"
#import "SeconViewController.h"

#define CELL_IDENTIFIER       @"cellIdentifier"
#define Drawer_Top            85

@interface ViewController ()
{
  UIView *navigationBarView;
  
  CGPoint point;
  BOOL flag;
  SeconViewController *seconViewControllerObj;
  BaseViewController *baseObj;
}
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.view.backgroundColor = [UIColor whiteColor];
  
  navigationBarView = [self setUpnavigationController];
  
  self.buttonBack.enabled = NO;
  self.buttonBack.hidden = YES;
  
  UILabel *viewDrag = [[UILabel alloc]init];
  viewDrag.frame = CGRectMake(100, 100, 200, 60);
  viewDrag.text = @"<---DRAG DRAWER";
  [self.view addSubview:viewDrag];
  
  }

-(void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}



@end
