//
//  ViewController.h
//  ObjCTest
//
//  Created by Diamond on 2/23/17.
//  Copyright © 2017 ethanthomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *dataArray;
@property UITableView *tableView;

@end

