//
//  ToDo.m
//  TemplateForTest
//
//  Created by Viviane Chan on 2016-07-14.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(instancetype)initWithTitle: (NSString *)title
                 description: (NSString *)toDoDescription
                    priority:(int)priorityNumber
                   completed: (bool) isCompleted
{
    self = [super init];
    if (self) {
        _title = title;
        _toDoDescription = toDoDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
    }
    return self;
}

@end
