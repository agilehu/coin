//
//  CMSCoinView.h
//  FlipViewTest
//
//  Created by Rebekah Claypool on 10/1/13.
//  Copyright (c) 2013 Coffee Bean Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoinView : UIView

- (id)initWithPrimaryView: (UIView *) primaryView andSecondaryView: (UIView *) secondaryView inFrame:(CGRect) frame;

@property (nonatomic, retain) UIView *primaryView;
@property (nonatomic, retain) UIView *secondaryView;
@property float spinTime;

@end
