//
//  ChildViewController.h
//  DrillDownExample
//
//  Created by Takeshi Fuchi on 2014/08/28.
//  Copyright (c) 2014 Words Vehicle Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property IBOutlet UITableView *tableView;
@end
