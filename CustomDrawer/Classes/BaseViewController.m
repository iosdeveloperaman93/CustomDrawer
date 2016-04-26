//
//  BaseViewController.m
//  ViewSlideDemo
//
//  Created by Aman Gangurde on 25/04/16.
//  Copyright © 2016 KloudData Inc. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Autolayout.h"
#import "SeconViewController.h"
#import "DrawerController.h"
#import "ViewController.h"

#define Drawer_Top                    85
#define CELL_IDENTIFIER               @"CellIdentifier"
#define MaxMenuViewWidth              [UIScreen mainScreen].bounds.size.width/2

@interface BaseViewController ()<UIGestureRecognizerDelegate>
{
  UIView *navigationBarView;
  
  CGPoint point;
  BOOL flag;
  BOOL tag;
  NSArray *controllers;
  SeconViewController *seconViewControllerObj;
}
@end

@implementation BaseViewController
@synthesize buttonBack;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor whiteColor];
  
  [self setUpnavigationController];
  
  controllers = [[NSArray alloc]initWithObjects:@"file Manager",@"Task",@"Utils",@"Widgets",@"Notes", nil];
  
  UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
  [rightRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
  [self.view addGestureRecognizer:rightRecognizer];
  
  UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
  [leftRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
  [self.view addGestureRecognizer:leftRecognizer];
    }

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
  if ([touch.view isKindOfClass:[UITableView class]])
  return YES;
  return NO;
}
  
-(void)swipeHandler:(UISwipeGestureRecognizer*)recognizer
{
  UIViewController *viewControllerSource = self.navigationController.visibleViewController;

  [DrawerController sharedInstance].sourceController = viewControllerSource;
  [DrawerController sharedInstance].maxVisibleWidth = MaxMenuViewWidth;
  
  if(([recognizer direction] == UISwipeGestureRecognizerDirectionLeft))
  {
    [[DrawerController sharedInstance] drawerTouched];
  }
  else if(([recognizer direction] == UISwipeGestureRecognizerDirectionRight))
          {
    [[DrawerController sharedInstance] drawerTouched];
  }
  if(([recognizer direction] == UISwipeGestureRecognizerDirectionUp))
  {
//    [[DrawerController sharedInstance] drawerTouched];
  }

  if(([recognizer direction] == UISwipeGestureRecognizerDirectionDown))
  {
//    [[DrawerController sharedInstance] drawerTouched];
  }

}

-(void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  
}


-(void)addChildViewController:(UIViewController *)childController
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIView*)setUpnavigationController
{
  self.navigationController.navigationBarHidden = YES;
  UIView  *navigationBar =  [self createNavigationBar];
  return navigationBar;
}

-(UIView*)createNavigationBar
{
  navigationBarView = [self.view viewWithTag:1];
  
  if (!navigationBarView)
  {
    navigationBarView = [[UIView alloc]init];
    navigationBarView.backgroundColor = [UIColor blackColor];
    navigationBarView.tag = 1;
    
    [self.view addSubview:navigationBarView];
    
    [navigationBarView enableAutolayout];
    [navigationBarView leadingMargin:0];
    [navigationBarView trailingMargin:0];
    [navigationBarView fixHeight:85];
    [navigationBarView topMargin:0];
    
    [self navigationBarButtonOnView:navigationBarView];
  }
  return navigationBarView;
}

- (void)navigationBarButtonOnView:(UIView*)navigationBar
{
  buttonBack = [[UIButton alloc]init];
  [buttonBack setTitle:@"BACK" forState:UIControlStateNormal];
  [buttonBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  buttonBack.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
  [buttonBack setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
  [buttonBack addTarget:self action:@selector(buttonBackEvent) forControlEvents:UIControlEventTouchUpInside];
  [navigationBar addSubview:buttonBack];
  
  [buttonBack enableAutolayout];
  [buttonBack leadingMargin:0.0];
  [buttonBack fixHeight:30];
  [buttonBack fixWidth:80];
  [buttonBack centerY];
}

-(void)buttonBackEvent
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}




@end
