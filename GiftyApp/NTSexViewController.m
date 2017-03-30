//
//  NTSexViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTSexViewController.h"

@interface NTSexViewController ()

@end

@implementation NTSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.delegate.selectedRowAtIndexPath = indexPath;
    
    switch (indexPath.row) {
        case NTSexMale:
            self.delegate.sexField.text = cell.textLabel.text;
            break;
        case NTSexFemale:
            self.delegate.sexField.text = cell.textLabel.text;
            break;
        default:
            break;
    }
    
    [tableView cellForRowAtIndexPath:self.delegate.selectedRowAtIndexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
