
//
//  StockFetcher.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/30/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockFetcherDelegate.h"
#import "Company.h"
#import "DataAccessObject.h"

@interface StockFetcher : NSObject



-(void)fetchStockPrice; // LIST OF COMPANIES AS PARAM

@property (nonatomic, assign) id<StockFetcherDelegate> delegate;

@property (nonatomic, retain) NSMutableArray <Company*> *companysList;
@property (nonatomic, retain) NSMutableArray <Company*> *companies;
@property (nonatomic, retain) NSString *stockPrice;






@end
