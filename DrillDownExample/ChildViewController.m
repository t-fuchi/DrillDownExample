//
//  ChildViewController.m
//  DrillDownExample
//
//  Created by Takeshi Fuchi on 2014/08/28.
//  Copyright (c) 2014 Words Vehicle Inc. All rights reserved.
//

#import "ChildViewController.h"

@implementation ChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)close:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)swipeRight:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %d", section + 1];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d-%d", indexPath.section + 1, indexPath.row + 1];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    ChildViewController *childViewController = [[ChildViewController alloc]
                                                initWithNibName:@"ChildViewController" bundle:nil];
    NSString *parent = self.navigationItem.prompt;
    if (!parent) parent = @"/";
    childViewController.navigationItem.prompt
        = [parent stringByAppendingPathComponent:cell.textLabel.text];
    childViewController.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    childViewController.navigationItem.rightBarButtonItem
        = [[UIBarButtonItem alloc] initWithTitle:@"Root"
                                           style:UIBarButtonItemStyleBordered
                                          target:self.navigationController
                                          action:@selector(popToRootViewControllerAnimated:)];
    [self.navigationController pushViewController:childViewController animated:YES];
}

@end
