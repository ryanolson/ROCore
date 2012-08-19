//
//  UIButton+ROColoredButton.m
//  SplitIt!
//
//  Created by Ryan Olson on 8/8/12.
//
//

#import "UIButton+ROColoredButton.h"

@implementation UIButton (ROColoredButton)

-(void)prepareButtonWithColor:(NSString *)color
{
    NSString * buttonName = [NSString stringWithFormat:@"%@Button", color];
    NSString * highlighedButtonName = [NSString stringWithFormat:@"%@ButtonHighlight", color];
    
    UIImage *buttonImage = [[UIImage imageNamed:buttonName] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:highlighedButtonName] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    // Set the background for any states you plan to use
    [self setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
}

@end
