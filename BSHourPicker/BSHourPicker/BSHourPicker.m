//
//  BSHourPicker.m
//  BSHourPicker
//
//  Created by Bisma on 06/04/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "BSHourPicker.h"

@implementation BSHourPicker{
    NSArray *displayHours;
    UIPickerView *datePicker;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    datePicker = [[UIPickerView alloc] init];
    datePicker.dataSource=self;
    datePicker.delegate=self;
    
    self.delegate=self;
    
    
    [self setInputView:datePicker];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    
    self.inputAccessoryView=toolbar;
}
-(void)doneClicked:(UITabBarItem*)item{
    
    [self endEditing:YES];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component==0) {
        
        return displayHours.count;
    }else{
        
        return 2;
    }
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component==1) {
        
        if (row==0) {
            return @"AM";
        }else{
            
            return @"PM";
        }
    }else{
        
        return [displayHours objectAtIndex:row];
    }
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return 80;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSInteger formateRow=[pickerView selectedRowInComponent:1];
    NSInteger timeRow=[pickerView selectedRowInComponent:0];
    
    NSString *hourFormate;
    if (formateRow==0) {
        hourFormate=@"AM";
    }else{
        
        hourFormate=@"PM";
    }
    
    self.text = [NSString stringWithFormat:@"%@ %@",[displayHours objectAtIndex:timeRow],hourFormate];
    
    if ([self.pickerDelegate respondsToSelector:@selector(timePicker:selctedItem:)]) {
        
        [self.pickerDelegate timePicker:self selctedItem:self.text];
    }
}
-(void)setDisplayHours:(NSArray*)hours{
    
    displayHours=hours;
    [datePicker reloadAllComponents];
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ([self.pickerDelegate respondsToSelector:@selector(shouldShowPicker:)]){
        
        return [self.pickerDelegate shouldShowPicker:self];
        
    }else{
        
        return YES;
    }
}



@end
