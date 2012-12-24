//
//  wwViewController.m
//  WeightWatcher
//
//  Created by Alix Cewall on 12/23/12.
//  Copyright (c) 2012 AC. All rights reserved.
//

#import "wwViewController.h"

@interface wwViewController ()

@end

@implementation wwViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    arrayColors = [[NSMutableArray alloc] init];
    [arrayColors addObject:@"Red"];
    [arrayColors addObject:@"Orange"];
    [arrayColors addObject:@"Yellow"];
    [arrayColors addObject:@"Green"];
    [arrayColors addObject:@"Blue"];
    [arrayColors addObject:@"Indigo"];
    [arrayColors addObject:@"Violet"];
    
    //loading from plist or property list
    NSString *myfile = [[NSBundle mainBundle] pathForResource:@"weightlist" ofType:@"plist"];
    arrayColors = [[NSArray alloc] initWithContentsOfFile:myfile];
    
    
    arrayPointOneDecimal = [[NSArray alloc] initWithObjects:
                  @".0", @".1", @".3",@".4", @".5", @".6",@".7", @".8", @".9", nil];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//retuerning how many section that picker will be having 
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 2;
}

//PickerViewController.m
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [arrayPointOneDecimal count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
        if(component ==0){
            return [arrayColors objectAtIndex:row];
        }
       
        return [arrayPointOneDecimal objectAtIndex:row];
       
}

//Implementation os delgate
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Selected Color: %@. Index of selected color: %i", [arrayColors objectAtIndex:row], row);
}

@end
