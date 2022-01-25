//
//  ViewController.m
//  ViewControllerPresenter
//
//  Created by Nitin Seshadri on 4/17/21.
//

#import "ViewController.h"

@import MapKit;

#import <objc/runtime.h>
#import <dlfcn.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *classNameText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.classNameText.delegate = self;
    self.classNameText.text = @"MKMapView";
    NSLog(@"[NSWK] Main view loaded.");
}

- (IBAction)presentClassBtn:(id)sender {
    Class theClass = NSClassFromString(self.classNameText.text);
    if (theClass != nil) {
        UIViewController *newVC = [UIViewController new];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(10, 40, 60, 40);
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [btn setTitle:@"Done" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(doneAction:) forControlEvents: UIControlEventTouchUpInside];
        
        if ([theClass isSubclassOfClass:[UIViewController class]]) {
            newVC = [theClass new];
        } else if ([theClass isSubclassOfClass:[UIView class]]) {
            newVC.view = [theClass new];
        } else {
            NSLog(@"WARNING: Class is not a subclass of UIViewController or UIView");
            return;
        }
        
        [newVC.view addSubview:btn];
        
        newVC.modalPresentationStyle = UIModalPresentationFullScreen;
        newVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self presentViewController:newVC animated:YES completion:nil];
    } else {
        NSLog(@"WARNING: NSClassFromString returned nil");
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self presentClassBtn:nil];
    return NO;
}

- (void)doneAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
