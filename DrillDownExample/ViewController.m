//
//  ViewController.m
//  DrillDownExample
//
//  Created by Takeshi Fuchi on 2014/08/28.
//  Copyright (c) 2014 Words Vehicle Inc. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ChildViewController *childViewController = [[ChildViewController alloc]
                                                initWithNibName:@"ChildViewController" bundle:nil];
    childViewController.title = @"/";
	self.navigationController = [[UINavigationController alloc] initWithRootViewController:childViewController];
}

- (IBAction)open:(id)sender
{
    [self presentViewController:self.navigationController animated:YES completion:nil];
}

@end
