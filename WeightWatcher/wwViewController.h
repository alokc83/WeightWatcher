//
//  wwViewController.h
//  WeightWatcher
//
//  Created by Alix Cewall on 12/23/12.
//  Copyright (c) 2012 AC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAD.h>

@interface wwViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UIPickerView *weightView;
    NSMutableArray *arrayWeight;
    
    NSMutableArray *arrayColors;
    
    NSMutableArray *arrayPointOneDecimal;
    
}

@end
