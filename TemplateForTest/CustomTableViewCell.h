//
//  CustomTableViewCell.h
//  TemplateForTest
//
//  Created by Viviane Chan on 2016-07-14.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface CustomTableViewCell : SWTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *ToDoDescription;

@end

