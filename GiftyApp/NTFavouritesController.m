//
//  NTFavouritesController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 17.05.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTFavouritesController.h"

@interface NTFavouritesController ()

@end

@implementation NTFavouritesController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
