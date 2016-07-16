//
//  AddToDoViewController.h
//  TemplateForTest
//
//  Created by Viviane Chan on 2016-07-14.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "MasterViewController.h"


@protocol AddNewProtocol <NSObject>

- (void)addNew:(ToDo *)newToDo;

@end

@interface AddToDoViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *toDoAdded;

@property (weak, nonatomic) IBOutlet UITextField *taskDescription;



@end
