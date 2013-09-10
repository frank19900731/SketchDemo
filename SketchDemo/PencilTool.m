//
//  PencilTool.m
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import "PencilTool.h"
#import "PathDrawingInfo.h"

@implementation PencilTool
@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self) {
        startTouches = [NSMutableArray array];
        startLocations = [NSMutableArray array];
        paths = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Tools类方法
- (void)activate
{
    
}

- (void)deactivate
{
    [startTouches removeAllObjects];
	[startLocations removeAllObjects];
	[paths removeAllObjects];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView *touchedView = [self.delegate viewForUseWithTool:self];
	for (UITouch *touch in [event allTouches])
    {
        [startTouches addObject:touch];
		CGPoint location = [touch locationInView:touchedView];
		[startLocations addObject:[NSValue valueWithCGPoint:location]];
        
		UIBezierPath *path = [UIBezierPath bezierPath];
		path.lineCapStyle = kCGLineCapRound;
		[path moveToPoint:location];
		[path setLineWidth:self.delegate.strokeWidth];
		[path addLineToPoint:location];
		[paths addObject:path];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView *touchedView = [self.delegate viewForUseWithTool:self];
    for (UITouch *touch in [event allTouches])
    {
		NSUInteger touchIndex = [startTouches indexOfObject:touch];
		if (touchIndex != NSNotFound)
        {
			CGPoint location = [touch locationInView:touchedView];
			UIBezierPath *path = [paths objectAtIndex:touchIndex];
			[path addLineToPoint:location];
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in [event allTouches])
    {
		NSUInteger touchIndex = [startTouches indexOfObject:touch];
		if (touchIndex != NSNotFound) {
			UIBezierPath *path = [paths objectAtIndex:touchIndex];
			PathDrawingInfo *info = [PathDrawingInfo pathDrawingInfoInit:path fillColor:[UIColor clearColor] strokeColor:self.delegate.strokeColor lineWidth:[self.delegate strokeWidth]];
			[self.delegate addDrawable:info];
            
			[startTouches removeObjectAtIndex:touchIndex];
			[startLocations removeObjectAtIndex:touchIndex];
			[paths removeObjectAtIndex:touchIndex];
		}
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)drawTemporary
{
    for(UIBezierPath *path in paths)
    {
        [self.delegate.strokeColor setStroke];
        [path stroke];
    }
}

#pragma mark - ToolDelegate代理方法


@end
