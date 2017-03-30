//
//  NTAgeViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NTAgeViewControllerDelegate <NSObject>

@property (weak, nonatomic) IBOutlet UITextField *ageField;

@end

@interface NTAgeViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <NTAgeViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *agePicker;

@end
