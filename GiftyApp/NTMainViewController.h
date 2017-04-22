//
//  NTMainViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTGiftViewController.h"
#import <CZPicker.h>

@interface NTMainViewController : UIViewController <UITextFieldDelegate, UIPopoverPresentationControllerDelegate, NTGiftViewControllerDelegate, CZPickerViewDelegate, CZPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *sexField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *occasionField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (strong, nonatomic) NSIndexPath *selectedRowAtIndexPath;

- (IBAction)searchButtonAction:(UIButton *)sender;

@end
