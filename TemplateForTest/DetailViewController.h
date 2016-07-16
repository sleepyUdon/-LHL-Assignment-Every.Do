//
//  DetailViewController.h
//  TemplateForTest
//
//  Created by Viviane Chan on 2016-07-14.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "ToDo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *Title;

@property (weak, nonatomic) IBOutlet UILabel *toDoDescription;


@end

