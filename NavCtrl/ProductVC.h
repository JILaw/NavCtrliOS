//
//  ProductVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "AddProductViewController.h"




@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSMutableArray<Product*> *products;

//@property (nonatomic, retain) NSMutableArray *products;
//@property (nonatomic, retain) NSMutableArray *productsImagesArray;

@property (nonatomic, retain) AddProductViewController *addProductViewController;


@property (strong, nonatomic) NSURL *productURL;

//@property (nonatomic) int hold;
@property (retain, nonatomic) NSString* companyImageName;

@property int companyId;



@end
