//
//  BSHourPicker.h
//  BSHourPicker
//
//  Created by Bisma on 06/04/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSHourPicker;

@protocol BSHourPickerDelegate <NSObject>

@required

-(BOOL)shouldShowPicker:(BSHourPicker*)picker;
-(void)timePicker:(BSHourPicker*)picker selctedItem:(NSString*)item;

@end

@interface BSHourPicker : UITextField<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (nonatomic,weak) id<BSHourPickerDelegate> pickerDelegate;

-(void)setDisplayHours:(NSArray*)hours;

@end
