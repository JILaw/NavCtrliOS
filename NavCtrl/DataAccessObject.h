//
//  (DAO) Data Access Object.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"

@interface DataAccessObject : NSObject

@property (nonatomic, retain) NSMutableArray <Company*> *companysList;

-(void) createDemoCompanys;

@end
