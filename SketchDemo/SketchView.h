//
//  SketchView.h
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SketchViewDelegate

// 绘制尚未保存到drawables中的图形
- (void)drawTemporary;

@end

@interface SketchView : UIView
{
    IBOutlet id <SketchViewDelegate> delegate;
    NSMutableArray *drawables;
}

@property (readonly) NSMutableArray *drawables;

@end