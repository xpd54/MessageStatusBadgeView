//
//  BadgeView.h
//  MessageStatusBadgeView
//
//  Created by Ravi Prakash on 09/01/15.
//  Copyright (c) 2015 OpenSource. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    Tick = 1,
    Clock
} BadgeType;


@interface BadgeView : UIView {
    CGRect badgeFrame;
    CGSize badgeSize;
}

/**
 * BadgeType set which type of badge you want.
 * Default value is Clock.
 */
@property (assign) BadgeType badgeType;

/**
 * If you set BadgeType Tick then it will set tick color.
 * Default value is gray.
 */
@property (nonatomic, retain) UIColor *badgeTickColor;

/**
 * If you set BadgeType Clock then it will set tick color.
 * Default value is gray.
 */
@property (nonatomic, retain) UIColor *badgeClockColor;

/**
 * Badge is in Square shape. It will set badge size width.
 * Default value is 14.0;
 */
- (void) setBadgeSizeWidth:(CGFloat)badgeSizeWidth;

/**
 * It will add badge view in right side of it's parent view.
 */
- (id) initWithView:(UIView *)view;

/**
 * It will chage the current badge type with given.
 */
- (void) changeBadgeWith:(BadgeType)badgeType;
@end