# BSHourPicker
You can replace your keyboard with a picker which shows custom hours.

![alt tag](https://cloud.githubusercontent.com/assets/16186934/24190122/6cd1c28a-0f09-11e7-869b-9626182ea172.png)
## How To Get Started
Download the project and drop BSDropDownClass into your project.
Don't forget to import the header file.

```
#import "BSHourPicker.h"
```
Drag a textfield in your storyboard and assign BSHourPicker it's custom class.
Implement the delegate methods and set hours you want to display in picker.

```
 _txtHours.pickerDelegate=self;
 [_txtHours setDisplayHours:@[@"3",@"4",@"5",@"6"]];
 ```
### Delegate Methods
```
#pragma mark - BSHourPicker Delegate Methods
-(BOOL)shouldShowPicker:(BSHourPicker *)picker{
    
    return YES;
}
-(void)timePicker:(BSHourPicker *)picker selctedItem:(NSString *)item{
    
    NSLog(@"selected item: %@",item);
}
```

I made this for my personal use but if you need anything else in it, feel free to branch and submit a pull request. I'll add it.

Happy codding!!!
