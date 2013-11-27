//
//  GAGraphics.m
//  Graphics&Animation
//
//  Created by TimTiger on 10/31/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import "GAGraphics.h"
#import "GAframework.h"

@implementation GAGraphics

// draw a line
+ (void)drawLineWithCGContextRef:(CGContextRef )context arrayPoints:(NSArray *)points {
   
    if ([points count] <= 1) {
        return;
    }
  
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    [[UIColor blackColor] setStroke];
    CGPoint startP;
    [[points objectAtIndex:0] getValue:&startP];
      [aPath moveToPoint:startP];
    
    for (int i = 1; i < [points count]; i++) {
        CGPoint tmpP;
        [[points objectAtIndex:i] getValue:&tmpP];
        [aPath addLineToPoint:tmpP];
    }
    [aPath closePath];
    [aPath stroke];
}

// draw a circle
+ (void)drawCircleWithCGContextRef:(CGContextRef)context radius:(CGFloat)radius {
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 50) radius:radius startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
    [[UIColor blackColor] setStroke];
    [aPath stroke];
}

// draw a round
+ (void)drawRoundWithCGContextRef:(CGContextRef)context radius:(CGFloat)radius {
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 50) radius:radius startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
    //[aPath stroke];
    [aPath fill];
}

// draw a rectangle
+ (void)drawRectangleWithCGContextRef:(CGContextRef)context startPoint:(CGPoint)startPoint
                             endPoint:(CGPoint)endPoint {
    CGFloat startX = startPoint.x;
    CGFloat startY = startPoint.y;
    CGFloat endX = endPoint.x;
    CGFloat endY = endPoint.y;
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:CGPointMake(endX,startY)];
    [aPath addLineToPoint:CGPointMake(endX, endY)];
    [aPath addLineToPoint:CGPointMake(startX, endY)];
    [aPath closePath];
    [[UIColor blackColor] setStroke];
    [aPath stroke];
}

+ (void)drawImageWithCGContextRef:(CGContextRef)context rect:(CGRect)rect withImage:(UIImage *)image {

    

        UIGraphicsBeginImageContext(CGSizeMake(50,50));
        [image drawInRect:CGRectMake(0, 0,50, 50)];
        UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();


    
    // 白色边界
   UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:rect.size.height/2 startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
    [[UIColor blackColor] setStroke];
    [aPath stroke];
    CGContextClip(context);

    CGContextDrawImage(context, rect,reSizeImage.CGImage);
    

    //[[UIColor colorWithPatternImage:reSizeImage] setFill];
    //[aPath fill];
    
}

+ (UIImage*)roundCorneredImage:(UIImage*)orig radius:(CGFloat)r {
    UIGraphicsBeginImageContextWithOptions(orig.size, NO, 0);
    [[UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointZero, orig.size}
                                cornerRadius:r] addClip];
    [orig drawInRect:(CGRect){CGPointZero, orig.size}];
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    
    if (ovalWidth == 0 || ovalHeight == 0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

+ (UIImage *)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, r, r);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    
    return img;
}


@end
