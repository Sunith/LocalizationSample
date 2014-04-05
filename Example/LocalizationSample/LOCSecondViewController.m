//
//  LOCSecondViewController.m
//  LocalizationSample
//
//  Created by Sunith Muralidharan Pillai on 4/5/14.
//  Copyright (c) 2014 Sunith Muralidharan Pillai. All rights reserved.
//

#import "LOCSecondViewController.h"
#import "SMPLocalization.h"

@interface LOCSecondViewController ()
{
    
    IBOutlet UILabel *lbl2;
    IBOutlet UILabel *lbl1;
}
@end

@implementation LOCSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lbl1.text = AMLocalizedString(@"hi", nil);
    lbl2.text = AMLocalizedString(@"hai", nil);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
