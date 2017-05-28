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
        
    self.starredItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favouriteStar"] style:UIBarButtonItemStylePlain target:self action:@selector(starredAction:)];
    
    self.navigationItem.rightBarButtonItem = self.starredItem;
    
    
    self.title = self.gift.caption;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
    label.text = self.navigationItem.title;
    label.textColor = [UIColor themeColor];
    label.font = [UIFont fontWithName:@"Avenir Next" size:21.f];
    label.backgroundColor = [UIColor clearColor];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    
    if (self.isFavorites) {
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectoryPath = [pathsArray objectAtIndex:0];
        NSString *destinationPath = [documentDirectoryPath stringByAppendingPathComponent:@"Favorites.plist"];
        
        self.giftData = [NSArray arrayWithContentsOfFile:destinationPath];
        
    } else {
        
        NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"Gift Category!!!" ofType:@"plist"];
        self.giftData = [NSArray arrayWithContentsOfFile:plistFile];
        
    }
    
    
}

#pragma mark - Favorites

- (void)starredAction:(UIBarButtonItem *)sender {
    
    if (!self.isFavorites) {
        self.starredItem.image = [UIImage imageNamed:@"selectedStar"];
        self.isFavorites = YES;
    } else {
        self.starredItem.image = [UIImage imageNamed:@"favouriteStar"];
        self.isFavorites = NO;
    }
    
}

- (BOOL)checkIfFavorites {
    
    
    return NO;
}


@end
