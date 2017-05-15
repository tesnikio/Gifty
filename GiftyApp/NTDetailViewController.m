//
//  NTDetailViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTDetailViewController.h"

@interface NTDetailViewController ()

@end

@implementation NTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.image = self.gift.image;
    self.textLabel.text = self.gift.descriptionText;
    
    //UIBarButtonItem *starredItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(starredAction:)];
    
    UIBarButtonItem *starredItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"favouriteStar"] style:UIBarButtonItemStylePlain target:self action:@selector(starredAction:)];
    
    self.navigationItem.rightBarButtonItem = starredItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)starredAction:(UIBarButtonItem *)sender {
    
    
    
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
