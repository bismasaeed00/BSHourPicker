//
//  ViewController.m
//  BSHourPicker
//
//  Created by Bisma on 06/04/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BSHourPicker *txtHours;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _txtHours.pickerDelegate=self;
    [_txtHours setDisplayHours:@[@"3",@"4",@"5",@"6"]];
}



#pragma mark - BSHourPicker Delegate Methods
-(BOOL)shouldShowPicker:(BSHourPicker *)picker{
    
    return YES;
}
-(void)timePicker:(BSHourPicker *)picker selctedItem:(NSString *)item{
    
    NSLog(@"selected item: %@",item);
}

@end
