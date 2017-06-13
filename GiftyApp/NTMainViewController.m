//
//  NTMainViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTMainViewController.h"
#import "NTGiftViewController.h"
#import "RKDropdownAlert.h"
#import "UIColor+Theme.h"

@interface NTMainViewController () <RKDropdownAlertDelegate>

@property (nonatomic, strong) CZPickerView *sexPicker;
@property (nonatomic, strong) CZPickerView *agePicker;
@property (nonatomic, strong) CZPickerView *occasionPicker;

@property (nonatomic, assign) NSInteger ageValue;

@end

@implementation NTMainViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [super viewDidDisappear:animated];
}

#pragma mark - RKDropdownAlertDelegate

- (BOOL)dropdownAlertWasTapped:(RKDropdownAlert *)alert {
    
    return YES;
    
}

- (BOOL)dropdownAlertWasDismissed {
    
    return YES;
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showGifts"]) {
        
        NTGiftViewController *vc = segue.destinationViewController;
        vc.sexFieldText = self.sexField.text;
        vc.ageValue = self.ageValue;
        vc.occasionFieldText = self.occasionField.text;
        
    }
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if (([self.sexField.text isEqualToString:@""] || [self.ageField.text isEqualToString:@""] || [self.occasionField.text isEqualToString:@""]) && [identifier isEqualToString:@"showGifts"]) {
        
        return NO;
    }
    
    return YES;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.sexField]) {
        
        self.sexPicker = [[CZPickerView alloc] initWithHeaderTitle:@"Пол" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
        self.sexPicker.headerBackgroundColor = [UIColor whiteColor];
        self.sexPicker.headerTitleColor = [UIColor themeColor];
        self.sexPicker.headerTitleFont = [UIFont fontWithName:@"Avenir Next" size:32.f];
        self.sexPicker.delegate = self;
        self.sexPicker.dataSource = self;
        self.sexPicker.needFooterView = NO;
        [self.sexPicker show];
        
        return NO;
        
    } else if ([textField isEqual:self.ageField]) {
        
        self.agePicker = [[CZPickerView alloc] initWithHeaderTitle:@"Возраст" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
        self.agePicker.headerBackgroundColor = [UIColor whiteColor];
        self.agePicker.headerTitleColor = [UIColor themeColor];
        self.agePicker.headerTitleFont = [UIFont fontWithName:@"Avenir Next" size:32.f];
        self.agePicker.delegate = self;
        self.agePicker.dataSource = self;
        self.agePicker.needFooterView = NO;
        [self.agePicker show];
        
        return NO;
        
    } else if ([textField isEqual:self.occasionField]) {
        
        self.occasionPicker = [[CZPickerView alloc] initWithHeaderTitle:@"Событие" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
        self.occasionPicker.headerBackgroundColor = [UIColor whiteColor];
        self.occasionPicker.headerTitleColor = [UIColor themeColor];
        self.occasionPicker.headerTitleFont = [UIFont fontWithName:@"Avenir Next" size:32.f];
        self.occasionPicker.delegate = self;
        self.occasionPicker.dataSource = self;
        self.occasionPicker.needFooterView = NO;
        [self.occasionPicker show];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - CZPickerViewDataSource

- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView {
    
    if ([pickerView isEqual:self.sexPicker]) {
        return 2;
    } else if ([pickerView isEqual:self.agePicker]) {
        return 100;
    } else if ([pickerView isEqual:self.occasionPicker]) {
        return 3;
    }
    
    return 0;
}

- (NSAttributedString *)czpickerView:(CZPickerView *)pickerView
               attributedTitleForRow:(NSInteger)row {
    
    NSAttributedString *title = nil;
    
    if ([pickerView isEqual:self.sexPicker]) {
        
        switch (row) {
            case 0:
                title = [[NSAttributedString alloc] initWithString:@"Мужчина" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 1:
                title = [[NSAttributedString alloc] initWithString:@"Женщина" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
                
            default:
                break;
        }
        
    } else if ([pickerView isEqual:self.agePicker]) {
        
        title = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row + 1] attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
        
        return title;
        
    } else if ([pickerView isEqual:self.occasionPicker]) {
        
        switch (row) {
            case 0:
                title = [[NSAttributedString alloc] initWithString:@"День рождения" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 1:
                title = [[NSAttributedString alloc] initWithString:@"Новый Год" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 2:
                title = [[NSAttributedString alloc] initWithString:@"День святого Валентина" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            default:
                break;
        }
        
    }
    
    return title;
}

#pragma mark - CZPickerViewDelegate

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row {
    
    if ([pickerView isEqual:self.sexPicker]) {
        self.sexField.attributedText = [self czpickerView:pickerView attributedTitleForRow:row];
    } else if ([pickerView isEqual:self.agePicker]) {
        self.ageField.attributedText = [self czpickerView:pickerView attributedTitleForRow:row];
        self.ageValue = row + 1;
    } else if ([pickerView isEqual:self.occasionPicker]) {
        self.occasionField.attributedText = [self czpickerView:pickerView attributedTitleForRow:row];
    }
    
}

#pragma mark - Actions

- (IBAction)searchButtonAction:(UIButton *)sender {
    
    if ([self.sexField.text isEqualToString:@""] || [self.ageField.text isEqualToString:@""] || [self.occasionField.text isEqualToString:@""]) {
        
        [RKDropdownAlert title:@"Ошибка!"
                       message:@"Заполните все поля для ввода!"
               backgroundColor:[UIColor themeColor]
                     textColor:[UIColor whiteColor]
                          time:1
                      delegate:self];
        
    }
    
}

@end
