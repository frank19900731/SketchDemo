//
//  SketchView.m
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import "SketchView.h"
#import "PathDrawingInfo.h"

@implementation SketchView
@synthesize drawables;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        drawables = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        drawables = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    for(id <Drawable> drawable in drawables)
    {
        [drawable draw];
    }
    [delegate drawTemporary];
}

@end
