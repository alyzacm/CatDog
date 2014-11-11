//
//  VSViewController.h
//  monkeyCat
//
//  Created by Amanda Berryhill on 3/1/14.
//  Copyright (c) 2014 Amanda Berryhill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIImageView *change_image;
@property (weak, nonatomic) IBOutlet UITextField *output_score;

- (IBAction)answerSelected:(id)sender;

@end
