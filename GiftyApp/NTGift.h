//
//  NTGift.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 08.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NTGift : NSObject

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) UIImage *image;

- (NSMutableArray *) giftsWithAgeCategory:(NSString *) ageCategory;

@end
