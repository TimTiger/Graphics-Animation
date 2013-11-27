//
//  GAGraphics.h
//  Graphics&Animation
//
//  Created by TimTiger on 10/31/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GAGraphics : NSObject


//draw a line
+ (void)drawLineWithCGContextRef:(CGContextRef)context arrayPoints:(CGPoint [])points;

// draw a circle
+ (void)drawCircleWithCGContextRef:(CGContextRef)context radius:(CGFloat)radius;

// draw a round
+ (void)drawRoundWithCGContextRef:(CGContextRef)context radius:(CGFloat)radius;

// draw a rectangle
+ (void)drawRectangleWithCGContextRef:(CGContextRef)context startPoint:(CGPoint)startPoint
                             endPoint:(CGPoint)endPoint;
@end
