//
//  GAGraphics.h
//  Graphics&Animation
//
//  Created by TimTiger on 10/31/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>


// draw type
typedef NS_ENUM(NSInteger, DrawType) {
    DrawLineType = 0,
    DrawCircleType,
    DrawRoundType,
    DrawRectangleType,
    DrawImageType,
};


@interface GAGraphics : NSObject


//draw a line
+ (void)drawLineWithCGContextRef:(CGContextRef )context arrayPoints:(NSArray *)points;

// draw a circle
+ (void)drawCircleWithCGContextRef:(CGContextRef)context radius:(CGFloat)radius;

// draw a round
+ (void)drawRoundWithCGContextRef:(CGContextRef)context radius:(CGFloat)radius;

// draw a rectangle
+ (void)drawRectangleWithCGContextRef:(CGContextRef)context startPoint:(CGPoint)startPoint
                             endPoint:(CGPoint)endPoint;

// draw a image
+ (void)drawImageWithCGContextRef:(CGContextRef)context rect:(CGRect)rect withImage:(UIImage *)image;

+ (UIImage*) roundCorneredImage: (UIImage*) orig radius:(CGFloat) r;

+ (UIImage *)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
@end
