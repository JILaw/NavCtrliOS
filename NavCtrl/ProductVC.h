//
//  ProductVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) NSMutableArray *productsImagesArray;

//@property (nonatomic, retain) NSMutableArray<NSString*> *appleProductImagesArray;
//@property (nonatomic, retain) NSMutableArray<NSString*> *googleProductImagesArray;
//@property (nonatomic, retain) NSMutableArray<NSString*> *teslaProductImagesArray;
//@property (nonatomic, retain) NSMutableArray<NSString*> *twitterProductImagesArray;

@property (strong, nonatomic) NSURL *productURL;

@property (nonatomic) int hold;


//@property (nonatomic, retain) NSArray<NSString*> *productImages;
@end
