//
//  LatestTableViewController.m
//  HackerNews
//
//  Created by Vetrichelvan on 12/06/15.
//  Copyright (c) 2015 Vetrichelvan. All rights reserved.
//

#import "LatestTableViewController.h"
#import "MBProgressHUD.h"
#import "WebViewController.h"

@interface LatestTableViewController ()

@end

@implementation LatestTableViewController

- (void)viewDidLoad {
    
    
    //self.datasourceName = @"newstories";
    HUD.detailsLabelText = @"Fetching Latest Stories";
    
        //self.navigationController.navigationBar.topItem.title = @"Latest Stories";
    
    [super viewDidLoad];
    
    

    // Do any additional setup after loading the view.
}


- (NSString *)datasourceName {
    
    return @"newstories";
}

- (NSString *)loadMsg {
    
    return @"Fetching Latest";
}


- (NSString *)navTitle {
    
    return @"Latest Stories";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *story = [self.storiesArray objectAtIndex:indexPath.row];
    //NSString *fullURL = [story valueForKey:@"url"];
    //if(indexPath.row == 0) {
    [self performSegueWithIdentifier:@"latesttoWebView" sender:story];
    //}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"latesttoWebView"])
    {
        //if you need to pass data to the next controller do it here
        WebViewController *controller = segue.destinationViewController;
        controller.story = sender;
    }
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