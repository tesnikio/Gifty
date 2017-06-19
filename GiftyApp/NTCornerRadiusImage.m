//
//  NTCornerRadiusImage.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 13.06.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTCornerRadiusImage.h"

@implementation NTCornerRadiusImage

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.bounds.size.height / 2.f;
    
}

@end
