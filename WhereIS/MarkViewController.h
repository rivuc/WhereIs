//
//  MarkViewController.h
//  WhereIS
//
//  Created by Francisco Rivera Uc on 13/10/13.
//  Copyright (c) 2013 Francisco Rivera Uc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WISMarkModel.h"

@interface MarkViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) WISMarkModel *model;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UITextField *keyTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *expireDataPicker;


- (id)initWithModel:(WISMarkModel *)aModel;

@end
