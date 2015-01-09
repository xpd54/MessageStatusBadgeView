//
//  BadgeView.m
//  MessageStatusBadgeView
//
//  Created by Ravi Prakash on 09/01/15.
//  Copyright (c) 2015 OpenSource. All rights reserved.
//

#import "BadgeView.h"

#define PADDING 3.0

@implementation BadgeView
@synthesize badgeType;
@synthesize badgeClockColor;
@synthesize badgeTickColor;

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initialize];
    }
    return self;
}

- (id) initWithView:(UIView *)view {
    NSAssert(view, @"View must not be nil.");
    badgeFrame = view.frame;
    return [self initWithFrame:view.bounds];
}

- (void) autoPositionFromSuperView {
    self.frame = CGRectMake(badgeFrame.size.width + PADDING,
                            badgeFrame.size.height/8,
                            badgeSize.width,
                            badgeSize.height);
}

- (void) initialize {
    if(self.badgeType) {
        self.badgeType = Clock;
    }
    // Default size
    if(!badgeSize.width) {
        badgeSize = CGSizeMake(14, 14);
    }
    self.badgeTickColor = [UIColor grayColor];
    self.badgeClockColor = [UIColor grayColor];
    [self setBackgroundColor:[UIColor clearColor]];
    [self autoPositionFromSuperView];
}

- (void) updateBadgeView {
    [self autoPositionFromSuperView];
}

- (void) setBadgeSizeWidth:(CGFloat)badgeSizeWidth {
    badgeSize = CGSizeMake(badgeSizeWidth,badgeSizeWidth);
    [self updateBadgeView];
}

- (void) changeBadgeWith:(BadgeType)badge {
    self.badgeType = badge;
    [self setNeedsDisplay];
}

- (void) drawRect:(CGRect)rect {
    if(self.badgeType == Tick) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 0.8);
        CGContextSetStrokeColorWithColor(context, self.badgeTickColor.CGColor);
        float startX = self.bounds.origin.x + PADDING;
        float startY = self.bounds.origin.y + self.bounds.size.height*3/4 - PADDING;
        float midX = self.bounds.origin.x + self.bounds.size.width/4;
        float midY = self.bounds.origin.y + self.bounds.size.height - PADDING;
        float finalX = self.bounds.size.width - PADDING;
        float finalY = self.bounds.origin.y + self.bounds.size.height/4;
        CGContextMoveToPoint(context, startX, startY);
        CGContextAddLineToPoint(context, midX, midY);
        CGContextAddLineToPoint(context, finalX, finalY);
        
        CGContextStrokePath(context);
        
    } else {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 0.8);
        CGContextSetStrokeColorWithColor(context,self.badgeClockColor.CGColor);
        CGRect rectangle = CGRectMake(self.bounds.origin.x + PADDING,
                                      self.bounds.origin.y + PADDING,
                                      self.bounds.size.width - PADDING*2,
                                      self.bounds.size.height - PADDING*2
                                      );
        float startX = rectangle.origin.x + rectangle.size.width/2;
        float startY = rectangle.origin.y + rectangle.size.height*0.09;
        float midX = rectangle.origin.x + rectangle.size.width/2;
        float midY = self.bounds.origin.y + self.bounds.size.height/2;
        float finalX = rectangle.origin.x + rectangle.size.width*0.19;
        float finalY = self.bounds.origin.y + self.bounds.size.height/2;
        CGContextMoveToPoint(context, startX, startY);
        CGContextAddLineToPoint(context, midX, midY);
        CGContextAddLineToPoint(context, finalX, finalY);
        
        CGContextAddEllipseInRect(context, rectangle);
        CGContextStrokePath(context);
    }
}
@end