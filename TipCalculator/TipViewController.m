//
//  TipViewController.m
//  TipCalculator
//
//  Created by Ashwini Satyanarayana on 6/4/14.
//  Copyright (c) 2014 Ashwini Satyanarayana. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentControl;
- (IBAction)onTapGesture:(id)sender;
- (IBAction)tipPercentAction:(id)sender;

@end

@implementation TipViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tips.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapGesture:(id)sender {
    [self tipPercentAction:self];
}

- (IBAction)tipPercentAction:(id)sender {
    float billAmt = [self.billField.text floatValue];
    float tipAmt = 0.0;
    if (self.tipPercentControl.selectedSegmentIndex == 0) {
        tipAmt =  billAmt * 0.1;
    } else if (self.tipPercentControl.selectedSegmentIndex == 1) {
        tipAmt =  billAmt * 0.15;
    } else if (self.tipPercentControl.selectedSegmentIndex == 2) {
        tipAmt =  billAmt * 0.2;
    }
    
    float totalAmt = billAmt + tipAmt;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmt];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmt];
    [self.view endEditing:YES];

}
@end
