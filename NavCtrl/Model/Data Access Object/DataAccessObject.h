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
{
	
	
	NSManagedObjectContext *context;
	NSManagedObjectModel *model;
}
+(DataAccessObject*) sharedDAO;


@property (nonatomic, retain) NSMutableArray <Company*> *companysList;

-(void)initModelContext;

-(void)undo;
-(void)redo;

-(void) loadAllCompanies;

-(void) createDemoCompanys;
-(void) addCompany: (Company*) company;
-(void) addProduct: (Product*) product companyId: (int) compId;

-(void) editProductWithId: (int) productId andCompanyId: (int) companyId product: (NSString*) newName andProductURL: (NSString*) productURL andWithProductImageURL: (NSString*) productImageURL;
-(void) editCompanyWithCompanyId: (int) companyId  andWithCompanyName: (NSString*) companyName andWithStockSymbol: (NSString*) companyStockSymbol andCompanyImageName: (NSString*) companyImageName;
-(void) deleteProductWithId: (int) productId andCompanyId: (int) companyId;
-(void) deleteCompanyWithCompanyId: (NSInteger) companyId;
- (void) rearrangeRowsAndSaveNewOrderToCoreDataWithfromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;


@end
