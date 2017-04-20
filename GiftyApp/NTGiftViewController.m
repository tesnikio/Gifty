//
//  NTGiftViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 04.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTGiftViewController.h"
#import "NTGiftCell.h"
#import "NTGift.h"

@interface NTGiftViewController ()

@property (nonatomic, strong) NSArray *gifts;

@end

@implementation NTGiftViewController

static NSString * const reuseIdentifier = @"GiftCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NTGift *gift = [[NTGift alloc] init];
        
    self.gifts = [gift allGifts];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.gifts count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NTGiftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NTGift *gift = [self.gifts objectAtIndex:indexPath.item];
    
    cell.captionLabel.text = gift.caption;
    cell.imageView.image = gift.image;
        
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
