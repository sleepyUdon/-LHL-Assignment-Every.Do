//
//  MasterViewController.m
//  TemplateForTest
//
//  Created by Viviane Chan on 2016-07-14.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"
#import "AddToDoViewController.h"
#import "SWTableViewCell.h"


@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, AddNewProtocol, SWTableViewCellDelegate>

@property NSMutableArray *objects;

@end


@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    

#pragma - Data setup
    
    self.objects = [[NSMutableArray alloc]init];
    
    ToDo *object1 = [[ToDo alloc]initWithTitle:@"Laundry" description:@"Wash shirts" priority:2 completed:NO];
    ToDo *object2 = [[ToDo alloc]initWithTitle:@"Gym" description:@"Yoga" priority:1 completed:NO];
    ToDo *object3 = [[ToDo alloc]initWithTitle:@"Read" description:@"Read chapter 5" priority:1 completed:NO];
    ToDo *object4 = [[ToDo alloc]initWithTitle:@"Groceries" description:@"Milk, bread" priority:2 completed:NO];
    
    [self.objects addObject:object1];
    [self.objects addObject:object2];
    [self.objects addObject:object3];
    [self.objects addObject:object4];

}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    
    [self performSegueWithIdentifier:@"addToDo" sender:self];
}


- (void)addNew:(ToDo *)newToDo {
    [self.objects insertObject:newToDo atIndex:0];
    
    // Tell our tableview to insert a new row
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    if ([segue.identifier isEqualToString:@"addToDo"]) {
        [segue.destinationViewController setDelegate:self];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];

    ToDo *object = self.objects[indexPath.row];
    cell.Title.text = object.title;
    cell.ToDoDescription.text = object.toDoDescription;
    cell.delegate = self;
    
    // Add utility buttons

        NSMutableArray *leftUtilityButtons = [NSMutableArray new];
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        [leftUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                    title:@"Completed"];
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                    title:@"Delete"];
    
        cell.leftUtilityButtons = leftUtilityButtons;
        cell.rightUtilityButtons = rightUtilityButtons;
        cell.delegate = self;
    
    // Configure the cell
    cell.Title.text = object.title;
    cell.ToDoDescription.text = object.toDoDescription;
    
        return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma button actions


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
            // Completed button is pressed
    NSLog (@"right button swiped");
            [cell hideUtilityButtonsAnimated:YES];
        }


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
        // Delete button is pressed
        NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
        [self.tableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
}



@end