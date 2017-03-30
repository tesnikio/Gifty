//
//  NTSexViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    NTSexMale,
    NTSexFemale
    
} NTSex;

@protocol NTSexViewControllerDelegate <NSObject>

@property (weak, nonatomic) IBOutlet UITextField *sexField;
@property (strong, nonatomic) NSIndexPath *selectedRowAtIndexPath;

@end

@interface NTSexViewController : UITableViewController

@property (weak, nonatomic) id <NTSexViewControllerDelegate> delegate;

@end
