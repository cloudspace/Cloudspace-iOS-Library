//
//  CSCheckbox.m
//  CSmlyMobile
//
//  Created by Joseph Lorich on 11/8/12.
//  Copyright (c) 2012 CSmly. All rights reserved.
//

#import "CSCheckbox.h"

@implementation CSCheckbox

// Returns a new CSCheckbox
+ (id)new
{
  return [[CSCheckbox alloc] init];
}

// Init with default frame
- (id)init
{
  return [self initWithFrame:CGRectMake(0, 0, 15, 15)];
}

// Create and add the image and recognizer objects
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
  
    if (self) {
      // Create image and add view
      _imageView_checkbox = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_checkbox_unchecked.png"]];
      [self addSubview:_imageView_checkbox];
      
      // Create and add tap recognizer
      _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleChecked)];
      [self addGestureRecognizer:_tapRecognizer];
      
      _checked = NO;
    }
    
    return self;
}

// Set up the frames
- (void) layoutSubviews
{
  // Set checkbox frame to be centered in overall frame
  [_imageView_checkbox setFrame:CGRectMake(self.frame.size.width/2-(15/2), self.frame.size.height/2-(15/2), 15, 15)];
  
  // Set the appropriate checkbox image
  if (_checked)
  {
    // Set image checked
    [_imageView_checkbox setImage:[UIImage imageNamed:@"icon_checkbox_checked.png"]];
  }
  else
  {
    // Set image unchecked
    [_imageView_checkbox setImage:[UIImage imageNamed:@"icon_checkbox_unchecked.png"]];
  }
}

// Change the value of checked
- (void) toggleChecked
{
  [self setChecked:!_checked];
}

// Set whether or not this checkbox is checked
- (void) setChecked:(bool)checked
{
  [self setChecked:checked triggerDelegate:YES];
}

// Set whether or not this checkbox is checked
// Option to avoid triggering the delegates
- (void) setChecked:(bool)checked triggerDelegate:(bool)triggerDelegate
{
  // Change value and fire delegate methods for change
  if (_checked != checked)
  {
    _checked = checked;
    
    // Update the view
    [self layoutSubviews];
    
    // Fires the checkboxValueDidChange method if the delegate responds to it
    if ([self.delegate respondsToSelector:@selector(checkboxValueDidChange:value:)] && triggerDelegate)
    {
      [self.delegate checkboxValueDidChange:self value:_checked];
    }
  }
}

// Returns whether or not the checkbox is checked
- (bool) checked
{
  return _checked;
}


@end
