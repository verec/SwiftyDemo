//
//  FunnySlider.m
//  Demo2
//
//  Created by verec on 28/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//


#import "FunnySlider.h"

@implementation FunnySlider

- (instancetype) init {
    if ((self = [super init])) {

        self.backgroundColor = [UIColor clearColor] ;

        UIPanGestureRecognizer * reco = [UIPanGestureRecognizer new] ;
        [reco addTarget:self action:@selector(panned:)] ;
        [self addGestureRecognizer:reco] ;
    }
    return self ;
}

- (void) panned: (UIPanGestureRecognizer *) reco {
    if (reco.state == UIGestureRecognizerStateChanged) {
        CGPoint p = [reco locationInView:self] ;
        if (p.x >= CGRectGetMinX(self.bounds) && p.x <= CGRectGetMaxX(self.bounds)) {
            CGFloat disp = p.x - CGRectGetMinX(self.bounds) ;
            CGFloat unit = disp / self.bounds.size.width ;
            self.unitValue = unit ;

            if (self.valueChangedListener) {
                self.valueChangedListener(unit) ;
            }

        }
    }
}

- (void) setUnitValue: (CGFloat) unitValue {
    self->_unitValue = unitValue ;
    [self setNeedsDisplay] ;
}

- (void) drawRect:(CGRect) rect {
    CGContextRef context = UIGraphicsGetCurrentContext() ;

    CGRect bounds = CGRectInset(self.bounds, 10.0, 0.0) ;
    CGContextSetLineWidth(context, 10.0f) ;
    CGContextSetLineCap(context, kCGLineCapRound) ;
    CGFloat minX = CGRectGetMinX(bounds) ;
    CGFloat maxX = CGRectGetMinX(bounds) + self.unitValue * bounds.size.width ;
    CGFloat midY = CGRectGetMidY(bounds) ;
    CGPoint points[] = {
        (CGPoint) {minX, midY}
    ,   (CGPoint) {maxX, midY}
    } ;
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor) ;
    CGContextStrokeLineSegments(context, points, 2) ;
}

@end
