//
//  CSCheckbox.h
//  CSmlyMobile
//
//  Created by Joseph Lorich on 11/8/12.
//  Copyright (c) 2012 CSmly. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CSCheckbox; // Set forward class since the definition is lower


/**
 * A collection of methods that can be implemented to watch the checkbox value chages
 */
@protocol CSCheckboxDelegate

@optional

- (void) checkboxValueDidChange: (CSCheckbox *)checkbox value:(bool)value; // Fires when the check box value changes

@end


/**
 * A checkbox UIControl
 */
@interface CSCheckbox : UIControl

#pragma mark - Members
{
  UIImageView *_imageView_checkbox;       ///< The displayed checkbox image
  UITapGestureRecognizer *_tapRecognizer; ///< The tap recognizer
  bool _checked;                          ///< Whether or not the checkbox is checked
}


#pragma mark - Properties
/**
 * Whether or not the checkbox is checked
 */
@property bool checked;

/**
 * The delegate for this checkbox
 */
@property(nonatomic,assign) id delegate;


#pragma mark - Methods
/**
 * Creates a new checkbox instance
 */
+ (id) new;

/**
 * Toggles the checbox on or off
 */
- (void) toggleChecked;

/**
 * Sets the checkbox as checked with the option to trigger the delegate or not
 */
- (void) setChecked:(bool)checked triggerDelegate:(bool)triggerDelegate;


@end
