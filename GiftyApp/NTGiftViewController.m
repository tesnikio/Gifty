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
#import "NTDetailViewController.h"
#import "UIColor+Theme.h"

@interface NTGiftViewController ()

@property (nonatomic, strong) NSArray *gifts;
@property (nonatomic, strong) NSString *currentPlistName;

@property (nonatomic, assign) CGFloat leftAndRightPaddings;
@property (nonatomic, assign) NSInteger itemsPerRow;

@end

@implementation NTGiftViewController

static NSString * const reuseIdentifier = @"GiftCell";

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.leftAndRightPaddings = 35.f;
    self.itemsPerRow = 2;
    
    CGFloat width = (CGRectGetWidth(self.collectionView.frame) - self.leftAndRightPaddings) / self.itemsPerRow;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    layout.sectionInset = UIEdgeInsetsMake(12.f, 12.f, 60.f, 10.f);
    layout.itemSize = CGSizeMake(width, width);
    
    NTGift *gift = [[NTGift alloc] init];
    
    if ([self.sexFieldText isEqualToString:@"Мужчина"]) {
        
        if (self.ageValue < 16) {
            
            self.currentPlistName = @"Male16-";
            
            self.gifts = [gift giftsWithAgeCategory:self.currentPlistName];
            
        } else if (self.ageValue >= 16 && self.ageValue < 30) {
            
            self.gifts = [gift giftsWithAgeCategory:@"Male16-30"];
            
            if ([self.occasionFieldText isEqualToString:@"День рождения"] || [self.occasionFieldText isEqualToString:@"Новый год"]) {
                
                NSArray *additionalGifts = [gift giftsWithAgeCategory:@"MaleAdd"];
    
                self.gifts = [self.gifts arrayByAddingObjectsFromArray:additionalGifts];
            }
            
        } else if (self.ageValue >= 30 && self.ageValue < 50) {
            
            self.gifts = [gift giftsWithAgeCategory:@"Male30-50"];
            
            if ([self.occasionFieldText isEqualToString:@"День рождения"] || [self.occasionFieldText isEqualToString:@"Новый год"]) {
                
                NSArray *additionalGifts = [gift giftsWithAgeCategory:@"MaleAdd"];
                
                self.gifts = [self.gifts arrayByAddingObjectsFromArray:additionalGifts];
            }
            
        } else {
            
            self.gifts = [gift giftsWithAgeCategory:@"Male50+"];
            
            if ([self.occasionFieldText isEqualToString:@"День рождения"] || [self.occasionFieldText isEqualToString:@"Новый год"] || [self.occasionFieldText isEqualToString:@"День святого Валентина"]) {
                
                NSArray *additionalGifts = [gift giftsWithAgeCategory:@"MaleAdd"];
                
                self.gifts = [self.gifts arrayByAddingObjectsFromArray:additionalGifts];
            }
            
        }
        
    } else {
        
        if (self.ageValue < 16) {
            
            self.gifts = [gift giftsWithAgeCategory:@"Female16-"];
            
        } else if (self.ageValue >= 16 && self.ageValue < 30) {
            
            self.gifts = [gift giftsWithAgeCategory:@"Female16-30"];
            
            if ([self.occasionFieldText isEqualToString:@"День рождения"] || [self.occasionFieldText isEqualToString:@"Новый Год"] || [self.occasionFieldText isEqualToString:@"День святого Валентина"] || [self.occasionFieldText isEqualToString:@"Международный женский день"]) {
                
                NSArray *additionalGifts = [gift giftsWithAgeCategory:@"FemaleAdd"];
                
                self.gifts = [self.gifts arrayByAddingObjectsFromArray:additionalGifts];
            }
            
        } else if (self.ageValue >= 30 && self.ageValue < 50) {
            
            self.gifts = [gift giftsWithAgeCategory:@"Female30-50"];
            
            if ([self.occasionFieldText isEqualToString:@"День рождения"] || [self.occasionFieldText isEqualToString:@"Новый год"]) {
                
                NSArray *additionalGifts = [gift giftsWithAgeCategory:@"FemaleAdd"];
                
                self.gifts = [self.gifts arrayByAddingObjectsFromArray:additionalGifts];
            }
            
        } else {
            
            self.gifts = [gift giftsWithAgeCategory:@"Female50+"];
            
            if ([self.occasionFieldText isEqualToString:@"День рождения"] || [self.occasionFieldText isEqualToString:@"Новый год"] || [self.occasionFieldText isEqualToString:@"Международный женский день"]) {
                
                NSArray *additionalGifts = [gift giftsWithAgeCategory:@"FemaleAdd"];
                
                self.gifts = [self.gifts arrayByAddingObjectsFromArray:additionalGifts];
            }
            
        }
        
    }

}

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
    
    NTDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NTDetailViewController"];
    
    NTGift *gift = [self.gifts objectAtIndex:indexPath.item];
    
    vc.gift = gift;
    vc.currentPlist = self.currentPlistName;
    
    [self.navigationController pushViewController:vc animated:YES];
     
}

@end
