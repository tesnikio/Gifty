//
//  NTDetailViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTDetailViewController.h"
#import "UIColor+Theme.h"

@interface NTDetailViewController ()

@property (nonatomic, strong) UIBarButtonItem *starredItem;

@property (nonatomic, assign) BOOL isFavorites;
@property (nonatomic, strong) NSArray *giftData;
@property (nonatomic, strong) NSString *favoriteFilter;
@property (nonatomic, assign) BOOL *currentGiftFavorite;

@end

@implementation NTDetailViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.gift.image;
    self.textLabel.text = self.gift.descriptionText;
        
//    self.starredItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favouriteStar"] style:UIBarButtonItemStylePlain target:self action:@selector(starredAction:)];
//    
//    self.navigationItem.rightBarButtonItem = self.starredItem;
    
    
    self.title = self.gift.caption;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
    label.text = self.navigationItem.title;
    label.textColor = [UIColor themeColor];
    label.font = [UIFont fontWithName:@"Avenir Next" size:21.f];
    label.backgroundColor = [UIColor clearColor];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
}

#pragma mark - Favorites




@end
