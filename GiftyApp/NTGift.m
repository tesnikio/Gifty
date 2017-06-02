//
//  NTGift.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 08.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTGift.h"

@implementation NTGift

- (NSMutableArray *) giftsWithAgeCategory:(NSString *) ageCategory {
    
    NSMutableArray *gifts = [NSMutableArray array];
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:ageCategory withExtension:@"plist"];
    NSArray *giftsFromPlist = [NSArray arrayWithContentsOfURL:URL];
    
    for (NSDictionary *dict in giftsFromPlist) {
        NTGift *gift = [[NTGift alloc] initWithDictionary:dict];
        [gifts addObject:gift];
    }
        
    return gifts;
        
}

- (id)initWithCaption:(NSString *) caption andImage:(UIImage *) image includingDescription:(NSString *) descriprion
{
    self = [super init];
    if (self) {
        
        self.caption = caption;
        self.descriptionText = descriprion;
        self.image = image;
        
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *) dictionary
{
    
    NSString *caption = [dictionary objectForKey:@"Caption"];
    NSString *descriptionText = [dictionary objectForKey:@"Description"];
    NSString *photoName = [dictionary objectForKey:@"Photo"];
    UIImage *image = [UIImage imageNamed:photoName];
    
    return [self initWithCaption:caption andImage:image includingDescription:descriptionText];
}

@end
