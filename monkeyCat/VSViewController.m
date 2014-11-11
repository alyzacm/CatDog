//
//  VSViewController.m
//  monkeyCat
//
//  Created by Amanda Berryhill on 3/1/14.
//  Copyright (c) 2014 Amanda Berryhill. All rights reserved.
//

#import "VSViewController.h"

enum image_type {
    CAT = 0,
    DOG = 1
};
enum image_type previous_image = 0;
int score_count;
int number_of_cat_images = 24;
int number_of_dog_images = 22;
NSArray *cat_image_files = nil;
NSArray *dog_image_files = nil;

@interface VSViewController ()

@end

@implementation VSViewController

-(void)initialization {
    score_count = 0;
    
    cat_image_files =
    @[@"cat00.jpg",
      @"cat01.jpg",
      @"cat02.jpg",
      @"cat03.jpg",
      @"cat04.jpg",
      @"cat05.jpg",
      @"cat06.jpg",
      @"cat07.jpg",
      @"cat08.jpg",
      @"cat09.jpg",
      @"cat10.jpg",
      @"cat11.jpg",
      @"cat12.jpg",
      @"cat13.jpg",
      @"cat14.jpg",
      @"cat15.jpg",
      @"cat16.jpg",
      @"cat17.jpg",
      @"cat18.jpg",
      @"cat19.jpg",
      @"cat20.jpg",
      @"cat21.jpg",
      @"cat22.jpg",
      @"cat23.jpg"];
    
    dog_image_files =
    @[@"dog00.jpg",
      @"dog01.jpg",
      @"dog02.jpg",
      @"dog03.jpg",
      @"dog04.jpg",
      @"dog05.jpg",
      @"dog06.jpg",
      @"dog07.jpg",
      @"dog08.jpg",
      @"dog09.jpg",
      @"dog10.jpg",
      @"dog11.jpg",
      @"dog12.jpg",
      @"dog13.jpg",
      @"dog14.jpg",
      @"dog15.jpg",
      @"dog16.jpg",
      @"dog17.jpg",
      @"dog18.jpg",
      @"dog19.jpg",
      @"dog20.jpg",
      @"dog21.jpg"];
}

- (void)newRandomImage {
    UIImage *img;
    int cat_or_dog = arc4random() % 2;
    int index = 0;
    switch (cat_or_dog) {
        case 0:
//            printf("Cat ");
            index = arc4random() % number_of_cat_images;
            img = [UIImage imageNamed:cat_image_files[index]];
            break;
        case 1:
//            printf("Dog ");
            index = arc4random() % number_of_dog_images;
            img = [UIImage imageNamed:dog_image_files[index]];
            break;
        default:
            break;
    }
//    printf("%u\n", index);
    previous_image = cat_or_dog;
    [_change_image setImage:img];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initialization];
        //initial random image
    [self newRandomImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)answerSelected:(id)sender {
    
    if ( _segment.selectedSegmentIndex == previous_image ) {
        score_count++;
            //printf("Score: %u\n", score_count);
        NSString *score_count_string = [NSString stringWithFormat:@"%i", score_count];
        _output_score.text = score_count_string;
    } else {
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *lose_controller = [mainStoryBoard instantiateViewControllerWithIdentifier:@"gameover"];
//        lose_controller.score_count = score_count;
        [self presentViewController:lose_controller animated:YES completion:nil];
    }
    
    [self newRandomImage];
    
}

@end
