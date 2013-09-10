//
//  SketchViewController.h
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Tools.h"
#import "PencilTool.h"
#import "SketchView.h"

@interface SketchViewController : UIViewController
<ToolDelegate, SketchViewDelegate, MFMailComposeViewControllerDelegate>
{
    PencilTool *pencilTool;
    IBOutlet SketchView *sketchView;
    IBOutlet UISlider *widthSlider;
    IBOutlet UISegmentedControl *colorControl;
    IBOutlet UIBarButtonItem *undoButton;
    IBOutlet UIBarButtonItem *clearButton;
    IBOutlet UIBarButtonItem *emailButton;
    
    UIColor *strokeColor;
    UIColor *fillColor;
    CGFloat strokeWidth;
}

@property (nonatomic, retain) PencilTool *pencilTool;
@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, retain) UIColor *fillColor;
@property (nonatomic, assign) CGFloat strokeWidth;

- (IBAction)changeWidthSlider:(id)sender;
- (IBAction)changeColorControl:(id)sender;
- (IBAction)touchUndoButton:(id)sender;
- (IBAction)touchClearButton:(id)sender;
- (IBAction)touchEmailButton:(id)sender;

@end
