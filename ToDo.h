//
//  ToDo.h
//  TemplateForTest
//
//  Created by Viviane Chan on 2016-07-14.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *toDoDescription;
@property int priorityNumber;
@property bool isCompleted;

-(instancetype)initWithTitle: (NSString *)title
                 description: (NSString *)toDoDescription
                    priority: (int)priorityNumber
                   completed: (bool) isCompleted;


@end
