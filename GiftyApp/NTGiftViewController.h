//
//  NTGiftViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 04.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NTGiftViewControllerDelegate <NSObject>

@property (weak, nonatomic) IBOutlet UITextField *sexField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *occasionField;

@end

@interface NTGiftViewController : UICollectionViewController

@property (weak, nonatomic) id <NTGiftViewControllerDelegate> delegate;

@end
