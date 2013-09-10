//
//  PathDrawingInfo.h
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drawable.h"

@interface PathDrawingInfo : NSObject <Drawable>
{
    UIBezierPath *path;
    UIColor *fillColor;
    UIColor *strokeColor;
    CGFloat linewidth;
}

@property (nonatomic, retain) UIBezierPath *path;
@property (nonatomic, retain) UIColor *fillColor;
@property (nonatomic, retain) UIColor *strokeColor;

- (id)initWithParams:(UIBezierPath *)path fillColor:(UIColor *)fillColor strokeColor:strokeColor lineWidth:(CGFloat)lineWidth;
+ (id)pathDrawingInfoInit:(UIBezierPath *)path fillColor:(UIColor *)fillColor strokeColor:strokeColor lineWidth:(CGFloat)lineWidth;

@end
