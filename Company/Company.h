//
//  Company.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Company : NSObject

@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSString *companyImageName;

@property (nonatomic, retain) NSMutableArray<Product*> *products;

-(instancetype) initWithCompanyName: (NSString*) companyName andWithCompanyImageName: (NSString*) companyImageName;

@end
