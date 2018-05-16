//
//  CompanyVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductVC.h"
#import "Company.h"
#import "AddCompanyViewController.h"
#import "DataAccessObject.h"

#import "StockFetcherDelegate.h"

@interface CompanyVC : UIViewController<UITableViewDelegate, UITableViewDataSource, StockFetcherDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;


//@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) NSMutableArray<Company*> *companies;


@property (nonatomic, retain) ProductVC *productViewController;
@property (nonatomic, retain) AddCompanyViewController *addCompanyViewController;

//@property (nonatomic, retain) NSMutableArray<NSString*> *companyImagesArray;
@property (strong, nonatomic) NSString *companyStockPrice;
@end
