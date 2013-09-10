//
//  Tools.h
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drawable.h"

@protocol ToolDelegate;
@protocol Drawable;

@protocol Tools <NSObject>

@property (assign, nonatomic) id <ToolDelegate> delegate;

- (void)activate;
- (void)deactivate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)drawTemporary;

@end

@protocol ToolDelegate

- (void)addDrawable:(id <Drawable>)d;
- (UIView *)viewForUseWithTool:(id <Tools>)t;
- (UIColor *)strokeColor;
- (UIColor *)fillColor;
- (CGFloat)strokeWidth;

@end
