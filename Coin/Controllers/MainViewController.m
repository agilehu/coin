//
//  MainViewController.m
//  Coin
//
//  Created by 胡 桓铭 on 14-5-19.
//  Copyright (c) 2014年 agile. All rights reserved.
//

#import "MainViewController.h"
#import "CoinView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *primaryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"profile.png"]];
    UIImageView *secondaryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"check-mark-512.gif"]];
    CoinView *coinView = [[CoinView alloc] initWithPrimaryView:primaryView andSecondaryView:secondaryView inFrame:CGRectMake(15.0f, 30.0f, 120.0f, 120.0f)];
    [self.view addSubview:coinView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
