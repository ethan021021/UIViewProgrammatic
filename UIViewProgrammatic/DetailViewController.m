//
//  DetailViewController.m
//  ObjCTest
//
//  Created by Diamond on 2/23/17.
//  Copyright © 2017 ethanthomas. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.detailLabel setCenter:CGPointMake(self.view.center.x, self.view.center.y)];
    self.detailLabel.textColor = [UIColor blackColor];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    self.detailLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [self.detailLabel setText:self.detail];
    [self.view addSubview:self.detailLabel];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.detail;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
