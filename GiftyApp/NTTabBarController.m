//
//  NTTabBarController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTTabBarController.h"
#import "UIColor+Theme.h"


@interface NTTabBarController ()

@end

@implementation NTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor themeColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    
    self.tabBar.tintColor = [UIColor themeColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
}

@end
