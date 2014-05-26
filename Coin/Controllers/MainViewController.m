//
//  MainViewController.m
//  Coin
//
//  Created by 胡 桓铭 on 14-5-19.
//  Copyright (c) 2014年 agile. All rights reserved.
//

#import "MainViewController.h"
#import "CoinView.h"
#import <pop.h>

@interface MainViewController ()
{
    CoinView *coinView;
}

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
    UIImageView *secondaryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"image_1.png"]];
    coinView = [[CoinView alloc] initWithPrimaryView:primaryView andSecondaryView:secondaryView inFrame:CGRectMake(100.0f , 120.0f, 120.0f, 120.0f)];
    [coinView setCenter:CGPointMake(coinView.center.x, 240)];
    [self.view addSubview:coinView];
    [self addGesture];
}

- (void)addGesture
{
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] init];
    [swipeGestureRecognizer addTarget:self action:@selector(gestureRecognizerHandle:)];
    [swipeGestureRecognizer setNumberOfTouchesRequired:1];
    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeGestureRecognizer];
}

- (IBAction)gestureRecognizerHandle:(id)sender
{
    POPSpringAnimation *coinRotation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    POPSpringAnimation *coinAnimationUp = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    CGPoint point = coinView.center;
    
    coinAnimationUp.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, -230)];
    
    //弹性值
    coinAnimationUp.springBounciness = 20.0;
    //弹性速度
    coinAnimationUp.springSpeed = 30.0;
    coinAnimationUp.dynamicsFriction = 150;

        
    POPDecayAnimation *rotationAnim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    
    coinRotation.velocity = @(10);
    [coinRotation setSpringSpeed:10];
//    [rotationAnim
    
    [coinView.layer pop_addAnimation:coinRotation forKey:@"rotationAnim"];

//    static BOOL displayingPrimary = YES;
//    [UIView transitionFromView:(displayingPrimary ? coinView.primaryView : coinView.secondaryView)
//                        toView:(displayingPrimary ? coinView.secondaryView : coinView.primaryView)
//                      duration: 1
//                       options: UIViewAnimationOptionTransitionFlipFromLeft+UIViewAnimationOptionCurveEaseInOut
//                    completion:^(BOOL finished) {
//                        if (finished) {
//                            //UIView *view = (displayingPrimary ? view1 : view2);
//                            
//                            displayingPrimary = !displayingPrimary;
//                        }
//                    }
//     ];
//    
//    [coinAnimationUp setCompletionBlock:^(POPAnimation *animation, BOOL kBool) {
//        POPSpringAnimation *coinAnimationDown = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
//        
//        coinAnimationDown.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, 240)];
//        
//        //弹性值
//        coinAnimationDown.springBounciness = 10.0;
//        //弹性速度
//        coinAnimationDown.springSpeed = 30.0;
//        coinAnimationDown.dynamicsFriction = 10;
//        coinAnimationDown.dynamicsTension = 200;
//        coinAnimationDown.dynamicsMass = 0.5;
//        
//        [coinView pop_addAnimation:coinAnimationDown forKey:@"changepositiondown"];
//    }];
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
