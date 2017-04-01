//
//  NTOccasionViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 31.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTOccasionViewController.h"

@interface NTOccasionViewController ()

@end

@implementation NTOccasionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 4;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString *title = nil;
    
    switch (row) {
        case 0:
            title = @"День рождения";
            break;
        case 1:
            title = @"Новый Год";
            break;
        case 2:
            title = @"День святого Валентина";
            break;
        case 3:
            if ([self.delegate.sexField.text isEqualToString:@"Мужчина"]) {
                title = @"День защитника Отечества";
            } else {
                title = @"Международный женский день";
            }
            break;
        default:
            break;
    }
    
    return title;
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.delegate.occasionField.text = [self pickerView:self.occasionPicker titleForRow:row forComponent:component];
    
}

@end
