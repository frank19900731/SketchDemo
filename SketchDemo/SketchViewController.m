//
//  SketchViewController.m
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import "SketchViewController.h"

@implementation SketchViewController
@synthesize pencilTool, fillColor, strokeColor, strokeWidth;

#pragma mark - 生命周期方法
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.pencilTool = [[PencilTool alloc] init];
    self.pencilTool.delegate = self;
    self.fillColor = [UIColor lightGrayColor];
    self.strokeColor = [UIColor blackColor];
    self.strokeWidth = 2.0;
    [sketchView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

#pragma mark - 工具栏单击响应方法
- (IBAction)changeWidthSlider:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    self.strokeWidth = slider.value;
}

- (IBAction)changeColorControl:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            self.strokeColor = [UIColor redColor];
            break;
        case 1:
            self.strokeColor = [UIColor greenColor];
            break;
        case 2:
            self.strokeColor = [UIColor blueColor];
            break;
        case 3:
            self.strokeColor = [UIColor blackColor];
            break;
        default:
            break;
    };
}

- (IBAction)touchUndoButton:(id)sender
{
    [sketchView.drawables removeLastObject];
    [sketchView setNeedsDisplay];
}

- (IBAction)touchClearButton:(id)sender
{
    [sketchView.drawables removeAllObjects];
    [sketchView setNeedsDisplay];
}

- (IBAction)touchEmailButton:(id)sender
{
	NSMutableData *pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData, sketchView.bounds, nil);
    
	UIGraphicsBeginPDFPage();
	[sketchView drawRect:sketchView.bounds];
	UIGraphicsEndPDFContext();

	MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
	mailComposer.mailComposeDelegate = self;
	[mailComposer addAttachmentData:pdfData mimeType:@"application/pdf" fileName:@"Dudel creation.pdf"];
    
	[self presentViewController:mailComposer animated:YES completion:NULL];
}

#pragma mark - 触摸响应操作（父类UIResponder中的函数）
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[pencilTool touchesBegan:touches withEvent:event];
	[sketchView setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[pencilTool touchesCancelled:touches withEvent:event];
	[sketchView setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[pencilTool touchesEnded:touches withEvent:event];
	[sketchView setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[pencilTool touchesMoved:touches withEvent:event];
	[sketchView setNeedsDisplay];
}

#pragma mark - ToolDelegate代理方法
- (void)addDrawable:(id <Drawable>)d {
	[sketchView.drawables addObject:d];
	[sketchView setNeedsDisplay];
}

- (UIView *)viewForUseWithTool:(id <Tools>)t {
	return sketchView;
}

- (UIColor *)strokeColor
{
    return strokeColor;
}

- (UIColor *)fillColor
{
    return fillColor;
}

- (CGFloat)strokeWidth
{
    return strokeWidth;
}

#pragma mark - SketchViewDelegate代理方法
- (void)drawTemporary {
	[self.pencilTool drawTemporary];
}

#pragma mark - MFMailComposeViewControllerDelegate代理方法
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
