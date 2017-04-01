//
//  NTOccasionViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 31.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NTOccasionViewControllerDelegate <NSObject>

@property (weak, nonatomic) IBOutlet UITextField *occasionField;
@property (weak, nonatomic) IBOutlet UITextField *sexField;

@end

@interface NTOccasionViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) id <NTOccasionViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *occasionPicker;

@end
