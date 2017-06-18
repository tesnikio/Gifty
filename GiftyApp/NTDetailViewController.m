//
//  NTDetailViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTDetailViewController.h"
#import "UIColor+Theme.h"

@interface NTDetailViewController () <UITextViewDelegate>

@end

@implementation NTDetailViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.gift.image;
    self.textView.text = self.gift.descriptionText;
    
    self.textView.delegate = self;
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderWidth = 3.f;
    self.imageView.layer.borderColor = [[UIColor themeColor] CGColor];
    
    self.title = self.gift.caption;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
    label.text = self.navigationItem.title;
    label.textColor = [UIColor themeColor];
    label.font = [UIFont fontWithName:@"Avenir Next" size:18.f];
    label.backgroundColor = [UIColor clearColor];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.textView scrollRangeToVisible:NSMakeRange(0, 0)];
    
}


@end
