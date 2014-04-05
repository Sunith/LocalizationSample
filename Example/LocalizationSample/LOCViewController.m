//
//  LOCViewController.m
//  LocalizationSample
//
//  Created by Sunith Muralidharan Pillai on 4/5/14.
//  Copyright (c) 2014 Sunith Muralidharan Pillai. All rights reserved.
//

#import "LOCViewController.h"
#import "SMPLocalization.h"

@interface LOCViewController ()<UIAlertViewDelegate>
- (IBAction)actionSet:(id)sender;

@end

@implementation LOCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // get ios device language if localy no language is set
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"userLanguage"])LocalizationSetLanguage(LocalizationGetLanguage);
    
}
-(void)viewWillAppear:(BOOL)animated
{
        [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSet:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"change language" message:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"userLanguage" ]] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"english",@"french", nil] show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        LocalizationSetLanguage(@"en");
        [[NSUserDefaults standardUserDefaults]setObject:@"en" forKey:@"userLanguage"];
    }
    else if (buttonIndex==2)
    {
        LocalizationSetLanguage(@"fr");
        [[NSUserDefaults standardUserDefaults]setObject:@"fr" forKey:@"userLanguage"];
    }
}

@end
