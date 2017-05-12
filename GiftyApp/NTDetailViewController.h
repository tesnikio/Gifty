//
//  NTDetailViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTGift.h"

@interface NTDetailViewController : UIViewController

@property (strong, nonatomic) NTGift *gift;

- (IBAction)okAction:(UIButton *)sender;

@end
