//
//  ViewController.m
//  RKYCyclicView
//
//  Created by Apple on 10/10/17.
//  Copyright © 2017 IndGlobal. All rights reserved.
//

#import "ViewController.h"
#import "RKYCollectionViewCell.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


@interface ViewController (){

    NSArray*TitlesArr;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TitlesArr=[[NSArray alloc]initWithObjects:@"First",@"Second",@"Third",@"Fourth", nil];
    
    FirstViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    
    newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self cycleFromViewController:self.currentViewController toViewController:newViewController];
    
    self.currentViewController = newViewController;

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return TitlesArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RKYCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"RKYCollectionViewCell" forIndexPath:indexPath];

    
    cell.titleLab.text=[TitlesArr objectAtIndex:indexPath.item];
    
    
    return cell;
    
    
}


- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"View taped");
    
    if (indexPath.item==0) {
        
        FirstViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
        
        newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self cycleFromViewController:self.currentViewController toViewController:newViewController];
        
        self.currentViewController = newViewController;
        

    }
    else if (indexPath.item==1){
        
        SecondViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        
        newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self cycleFromViewController:self.currentViewController toViewController:newViewController];
        
        self.currentViewController = newViewController;

    
    
    }
    else if (indexPath.item==2){
        
        ThirdViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
        
        newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self cycleFromViewController:self.currentViewController toViewController:newViewController];
        
        self.currentViewController = newViewController;
        
    }
    else{
    
        FourthViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FourthViewController"];
        
        newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self cycleFromViewController:self.currentViewController toViewController:newViewController];
        
        self.currentViewController = newViewController;

    
    }
    
    
}




#pragma mark - RKYCureent View Transaction

- (void)cycleFromViewController:(UIViewController*) oldViewController
               toViewController:(UIViewController*) newViewController {
    
    // self.controllerHeight.constant = 180;
    [oldViewController willMoveToParentViewController:nil];
    [self addChildViewController:newViewController];
    
    //-------------------------------------self.RKYcontainerView -> container view in storyboard---------------------//
    [self addSubview:newViewController.view toView:self.RKYcontainerView];
    [newViewController.view layoutIfNeeded];
    // set starting state of the transition
    newViewController.view.alpha = 0;
    
    newViewController.view.alpha = 1;
    oldViewController.view.alpha = 0;
    [oldViewController.view removeFromSuperview];
    [oldViewController removeFromParentViewController];
    [newViewController didMoveToParentViewController:self];
    [UIView animateWithDuration:10.5
                     animations:^{
                         newViewController.view.alpha = 1;
                         oldViewController.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [oldViewController.view removeFromSuperview];
                         [oldViewController removeFromParentViewController];
                         [newViewController didMoveToParentViewController:self];
                     }];
    
    
}

#pragma mark- RkyConstraints 

- (void)addSubview:(UIView *)subView toView:(UIView*)parentView {
    [parentView addSubview:subView];
    NSDictionary * views = @{@"subView" : subView,};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|"
                                                                   options:0
                                                                   metrics:0
                                                                     views:views];
    [parentView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|"
                                                          options:0
                                                          metrics:0
                                                            views:views];
    [parentView addConstraints:constraints];
}


@end
