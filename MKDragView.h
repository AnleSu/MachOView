/**
 *
 * Created by https://github.com/mythkiven/ on 19/08/14.
 * Copyright © 2019年 mythkiven. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>

@protocol MKDragViewDelegate;

@interface MKDragView : NSView

@property (assign) IBOutlet id<MKDragViewDelegate> delegate;

@end

@protocol MKDragViewDelegate <NSObject>

-(void)dragViewFileList:(NSArray*)fileList;

@end

