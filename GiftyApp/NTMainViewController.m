//
//  NTMainViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTMainViewController.h"

@interface NTMainViewController ()

@end

@implementation NTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showSex"]) {
        
        NTSexViewController *controller = segue.destinationViewController;
        UIPopoverPresentationController *popController = [controller popoverPresentationController];
        popController.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popController.sourceRect = CGRectMake(CGRectGetMidX(self.sexField.bounds), CGRectGetMidY(self.sexField.bounds), 0, 0);
        controller.delegate = self;
        controller.popoverPresentationController.delegate = self;
        controller.preferredContentSize = CGSizeMake(200.f, 88.f);
        
    } else if ([segue.identifier isEqualToString:@"showAge"]) {
        
        NTAgeViewController *controller = segue.destinationViewController;
        UIPopoverPresentationController *popController = [controller popoverPresentationController];
        popController.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popController.sourceRect = CGRectMake(CGRectGetMidX(self.ageField.bounds), CGRectGetMidY(self.ageField.bounds), 0, 0);
        controller.delegate = self;
        controller.popoverPresentationController.delegate = self;
        controller.preferredContentSize = CGSizeMake(375.f, 216.f);
        
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.sexField]) {
        [self performSegueWithIdentifier:@"showSex" sender:textField];
        return NO;
    } else if ([textField isEqual:self.ageField]) {
        [self performSegueWithIdentifier:@"showAge" sender:textField];
        return NO;
    }
    
    return YES;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

#pragma mark - Actions

- (IBAction)searchButtonAction:(UIButton *)sender {
    
}

@end
