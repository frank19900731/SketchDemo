//
//  PathDrawingInfo.m
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import "PathDrawingInfo.h"

@implementation PathDrawingInfo
@synthesize path, fillColor, strokeColor;

#pragma mark - 获取实例
- (id)initWithParams:(UIBezierPath *)p fillColor:(UIColor *)f strokeColor:(id)s lineWidth:(CGFloat)l
{
    self.path = p;
    self.fillColor = f;
    self.strokeColor = s;
    linewidth = l;
    return self;
}

+ (id)pathDrawingInfoInit:(UIBezierPath *)path fillColor:(UIColor *)fillColor strokeColor:(id)strokeColor lineWidth:(CGFloat)lineWidth
{
    return [[[self alloc] init] initWithParams:path fillColor:fillColor strokeColor:strokeColor lineWidth:lineWidth];
}

#pragma mark - Drawable代理方法
- (void)draw
{
    [self.path setLineWidth:linewidth];
    if(self.fillColor)
    {
        [self.fillColor setFill];
        [self.path fill];
    }
    if(self.strokeColor)
    {
        [self.strokeColor setStroke];
        [self.path stroke];
    }
}

@end
