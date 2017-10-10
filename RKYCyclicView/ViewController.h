//
//  ViewController.h
//  RKYCyclicView
//
//  Created by Apple on 10/10/17.
//  Copyright © 2017 IndGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *RKYcontainerView;
@property (weak, nonatomic) IBOutlet UICollectionView *RKYcollectionview;

@property (weak, nonatomic) UIViewController *currentViewController;

@end

