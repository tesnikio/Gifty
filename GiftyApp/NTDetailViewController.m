//
//  NTDetailViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTDetailViewController.h"

@interface NTDetailViewController ()

@property (nonatomic, strong) UIBarButtonItem *starredItem;
@property (nonatomic, assign) BOOL isStarred;

@end

@implementation NTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.image = self.gift.image;
    self.textLabel.text = self.gift.descriptionText;
    
    self.starredItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favouriteStar"] style:UIBarButtonItemStylePlain target:self action:@selector(starredAction:)];
    
    self.navigationItem.rightBarButtonItem = self.starredItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)starredAction:(UIBarButtonItem *)sender {
    
    if (!self.isStarred) {
        self.starredItem.image = [UIImage imageNamed:@"selectedStar"];
        self.isStarred = YES;
    } else {
        self.starredItem.image = [UIImage imageNamed:@"favouriteStar"];
        self.isStarred = NO;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
