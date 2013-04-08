//
//  CSSlider.m
//  CSmlyMobile
//
//  Created by Joseph Lorich on 12/31/12.
//  Copyright (c) 2012 CSmly. All rights reserved.
//

#import "CSSlider.h"

@implementation CSSlider

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  
  if (self)
  {
    [self addTarget:self
          action:@selector(valueChanged)
          forControlEvents:UIControlEventValueChanged
     ];
  }
  
  return self;
}

- (void) valueChanged
{
  if (settingValue) return;
  
  
  int closest = 0;
  
  
  if (self.incrementAmount > 0)
  {
    for (float i = 0; i <= self.maximumValue; i++)
    {
      if (abs(self.value - i*self.incrementAmount) < abs(self.value - closest))
      {
        closest = (float)i*self.incrementAmount;
      }
    }
    
    settingValue = YES;
    self.value = closest;

    // Fire slider value did change delegate (if it responds)
    if ([self.delegate respondsToSelector:@selector(slider:valueDidChange:)])
    {
      [self.delegate slider:self valueDidChange:closest];
    }
    
    settingValue = NO;
  }
}

@end
