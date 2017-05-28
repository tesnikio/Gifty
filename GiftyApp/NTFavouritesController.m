//
//  NTFavouritesController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 20.05.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTFavouritesController.h"

@interface NTFavouritesController ()

@property (nonatomic, strong) NSMutableArray *theFavorites;

@end

@implementation NTFavouritesController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectoryPath = [pathsArray objectAtIndex:0];
    
    NSString *destinationPath = [documentDirectoryPath stringByAppendingPathComponent:@"Favorites.plist"];
    
    if ([fileManager fileExistsAtPath:destinationPath]) {
        
        
        
    } else {
        
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Favorites.plist"];
        
        [fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&error];
    }
    
    self.theFavorites = [NSMutableArray arrayWithContentsOfFile:destinationPath];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.theFavorites count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

@end
