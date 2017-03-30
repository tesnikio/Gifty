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
        controller.delegate = self;
        controller.popoverPresentationController.delegate = self;
        controller.preferredContentSize = CGSizeMake(200.f, 88.f);
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.sexField]) {
        [self performSegueWithIdentifier:@"showSex" sender:textField];
        return NO;
    }
    
    return YES;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

- (IBAction)searchButtonAction:(UIButton *)sender {
}
@end
