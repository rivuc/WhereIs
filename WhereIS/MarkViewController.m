//
//  MarkViewController.m
//  WhereIS
//
//  Created by Francisco Rivera Uc on 13/10/13.
//  Copyright (c) 2013 Francisco Rivera Uc. All rights reserved.
//

#import "MarkViewController.h"
#import "WISMarkModel.h"

@interface MarkViewController ()

@end

@implementation MarkViewController

#pragma mark -  Init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithModel:(WISMarkModel *)aModel
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        self.title = @"Details";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self LoadScroll];
    [self syncViewToModel];
    _userTextField.delegate = self;
    _keyTextField.delegate = self;
   // _commentTextView.delegate = self;
    _scroll.delegate = self;
    [self AsignTouchEventToScroll];
}

-(void)LoadScroll
{
    [self.scroll setScrollEnabled:YES];
    [self.scroll setContentSize:CGSizeMake(320, 750)];
}

- (void)syncViewToModel
{
    self.userTextField.text = self.model.UserNameIphone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AsignTouchEventToScroll
{
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(HideKeyboard)];
    [recognizer setNumberOfTapsRequired:1];
    [recognizer setNumberOfTouchesRequired:1];
    [_scroll addGestureRecognizer:recognizer];
}

#pragma mark Common methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return  NO;
}

- (void)HideKeyboard
{
    [_userTextField resignFirstResponder];
    [_keyTextField resignFirstResponder];
    [_commentTextView resignFirstResponder];
    
}
@end
