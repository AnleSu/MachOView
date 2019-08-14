/**
 *
 * Created by https://github.com/mythkiven/ on 19/08/14.
 * Copyright © 2019年 mythkiven. All rights reserved.
 *
 */

#import "MKDragView.h"

@implementation MKDragView
@synthesize delegate = _delegate;

- (void)dealloc {
    [self setDelegate:nil];
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
    }
    return self;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    NSPasteboard *pboard = [sender draggingPasteboard];
    if ([[pboard types] containsObject:NSFilenamesPboardType]) {
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    NSPasteboard *zPasteboard = [sender draggingPasteboard];
    NSArray *list = [zPasteboard propertyListForType:NSFilenamesPboardType];
    if(self.delegate && [self.delegate respondsToSelector:@selector(dragViewFileList:)]) {
        [self.delegate dragViewFileList:list];
    }
    return YES;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}

@end

