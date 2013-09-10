//
//  PencilTool.h
//  SketchDemo
//
//  Created by Frank on 9/10/13.
//  Copyright (c) 2013 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tools.h"

@interface PencilTool : NSObject <Tools>
{
    id <ToolDelegate> delegate;
    NSMutableArray *startTouches;
    NSMutableArray *startLocations;
    NSMutableArray *paths;
}

@end
