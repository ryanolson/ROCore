//
//  UITextView+QCAdditions.m
//  OTTracker
//
//  Created by Ryan Olson on 2/26/13.
//  Copyright (c) 2013 Quantum Coding. All rights reserved.
//

#import "UITextView+QCAdditions.h"

@implementation UITextView (QCAdditions)

-(void)removeTextViewInsets
{
/*
    Remove the default insets from a UITextView
    http://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview
 
    If used from a storyboard, you can call this from awakeFromNib.
*/
    self.contentInset = UIEdgeInsetsMake(-4,-8,0,0);
}
@end
