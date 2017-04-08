//
//  NTGiftCell.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 04.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NTGift;

@interface NTGiftCell : UICollectionViewCell

@property (nonatomic, strong) NTGift *gift;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end
