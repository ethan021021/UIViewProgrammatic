//
//  ViewController.m
//  ObjCTest
//
//  Created by Diamond on 2/23/17.
//  Copyright © 2017 ethanthomas. All rights reserved.
//

#import "MainViewController.h"

@interface UIViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.dataArray = [NSMutableArray arrayWithObjects:@"Ethan", @"Joey", @"Chris", @"Cool", nil];
    self.dataArray = [@[@"Ethan", @"Chris"] mutableCopy];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.automaticallyAdjustsScrollViewInsets = true;
    [[self view] addSubview:self.tableView];
    self.title = @"Table View Example";
    UIBarButtonItem *addBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnTapped)];
    self.navigationItem.rightBarButtonItem = addBtnItem;
}

- (void) addBtnTapped {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add a new one" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Enter new name here";
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *name = alert.textFields[0].text;
        if ([name  isEqual: @""] || [name isEqual: @" "]) {
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Please enter a valid string." preferredStyle:UIAlertControllerStyleAlert];
            [errorAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:errorAlert animated:true completion:nil];
            return;
        }
        [self.dataArray addObject:name];
        [self.tableView reloadData];
    }]];
    [self presentViewController:alert animated:true completion:nil];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
//    [self performSegueWithIdentifier:@"segueToDetail" sender:cell];
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.detail = cell.textLabel.text;
    [self.navigationController pushViewController:detailVC animated:true];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
}

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    DetailViewController *detailVC = [segue destinationViewController];
//    UITableViewCell *cell = sender;
//    detailVC.detail = cell.textLabel.text;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
