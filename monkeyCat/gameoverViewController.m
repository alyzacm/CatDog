//
//  gameoverViewController.m
//  monkeyCat
//
//  Created by Amanda Berryhill on 3/2/14.
//  Copyright (c) 2014 Amanda Berryhill. All rights reserved.
//

#import "gameoverViewController.h"

@interface gameoverViewController ()
@end

@implementation gameoverViewController

int number_of_cat_lose_images = 3;
int number_of_dog_lose_images = 3;
NSArray *cat_lose_image_files = nil;
NSArray *dog_lose_image_files = nil;

-(void)initialization {
    
    cat_lose_image_files =
    @[@"catlosing00.jpg",
      @"catlosing01.jpg",
      @"catlosing02.jpg"];
    
    dog_lose_image_files =
    @[@"doglosing00.jpg",
      @"doglosing01.jpg",
      @"doglosing02.jpg"];
}

- (void)newRandomImage {
    UIImage *img;
    int cat_or_dog = arc4random() % 2;
    int index = 0;
    switch (cat_or_dog) {
        case 0:
                //            printf("Cat ");
            index = arc4random() % number_of_cat_lose_images;
            img = [UIImage imageNamed:cat_lose_image_files[index]];
            break;
        case 1:
                //            printf("Dog ");
            index = arc4random() % number_of_dog_lose_images;
            img = [UIImage imageNamed:dog_lose_image_files[index]];
            break;
        default:
            break;
    }

    [_losing_image setImage:img];
}

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
	// Do any additional setup after loading the view.
    [self initialization];
    [self newRandomImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
