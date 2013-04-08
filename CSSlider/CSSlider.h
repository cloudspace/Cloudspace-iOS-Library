//
//  CSSlider.h
//  CSmlyMobile
//
//  Created by Joseph Lorich on 12/31/12.
//  Copyright (c) 2012 CSmly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSSlider;

#pragma mark - CSSlider Delegate Protocol
/**
 * A collection of methods related to the slider changing
 */
@protocol CSSliderDelegate

@optional

/**
 * Firex when the slider value changes
 */
- (void) slider:(CSSlider *)slider valueDidChange:(float)value;

@end


#pragma mark - CSSlider Class Definition
/**
 * A UISlider with fixed increments and a delegate to notify of updates
 */
@interface CSSlider : UISlider


#pragma mark - Members
{
  BOOL settingValue; ///< Whether or not the value is currently being set
}


#pragma mark - Properties
@property int incrementAmount;           ///< The amount each increment takes up
@property(nonatomic,assign) id delegate; ///< The delegate for this slider


@end
