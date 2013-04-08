//
//  CSCheckboxButton.m
//  CSmlyMobile
//
//  Created by Joseph Lorich on 2/28/13.
//  Copyright (c) 2013 CSmly. All rights reserved.
//

#import "CSCheckboxButton.h"

@implementation CSCheckboxButton

/**
 * Initializes the button and checkbox from a storyboard
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  
  if (self) {
    // Create checbox centered vertically in the frame to the left
    self.checkbox = [[CSCheckbox alloc] init];
    
    // Disable user interaction on the checkbox itself
    [self.checkbox setUserInteractionEnabled:NO];
    
    // Add the checkbox view
    [self addSubview:self.checkbox];
    
    // Add press target for button to check or uncheck the checkbox
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
  }
  
  return self;
}

/**
 * Initializes the button and checkbox with a frame
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
  
    if (self) {
      // Create checbox centered vertically in the frame to the left
      self.checkbox = [[CSCheckbox alloc] init];
      
      // Disable user interaction on the checkbox itself
      [self.checkbox setUserInteractionEnabled:NO];
      
      // Add the checkbox view
      [self addSubview:self.checkbox];
      
      // Add press target for button to check or uncheck the checkbox
      [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
  
    return self;
}

/**
 * Lays out the subviews
 */
- (void)layoutSubviews
{
  [super layoutSubviews];
  
  // Center checkbox vertically and align to the left
  [self.checkbox setFrame:CGRectMake(0,(self.frame.size.height/2.0)-9,15,15)];

  // Move the title label to the appropriate location
  CGRect titleFrame = CGRectMake(30,0,self.frame.size.width - 30, self.frame.size.height);
  [self.titleLabel setFrame:titleFrame];
}

/**
 * Toggles the checkbox on button click
 */
- (void) buttonClick:(id)sender
{
  [self.checkbox toggleChecked];
}


@end
