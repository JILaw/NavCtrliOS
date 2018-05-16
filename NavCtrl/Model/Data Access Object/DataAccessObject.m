//
//  (DAO) Data Access Object.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "DataAccessObject.h"

#import "CompanyEntity+CoreDataProperties.h"
#import "ProductEntity+CoreDataProperties.h"


@implementation DataAccessObject

+(DataAccessObject *) sharedDAO {
	static DataAccessObject *_sharedDAO = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedDAO = [[self alloc] init];
	});
	return _sharedDAO;
}



// CREATION OF COMPANIES AND PRODUCTS CODE

// Companies...

-(void) createDemoCompanys {
	
	// Companies...
	Company *apple = [[Company alloc] initWithCompanyName:@"Apple" andWithCompanyStockSymbol: @"AAPL" andWithCompanyImageName:@"http://simpleicon.com/wp-content/uploads/apple-128x128.png"];
	Company *google = [[Company alloc] initWithCompanyName:@"Google" andWithCompanyStockSymbol: @"GOOG" andWithCompanyImageName:@"http://simpleicon.com/wp-content/uploads/google_chrome_1.png"];
	Company *tesla = [[Company alloc] initWithCompanyName:@"Tesla" andWithCompanyStockSymbol: @"TSLA" andWithCompanyImageName:@"http://www.timtyson.us/wordpress/wp-content/uploads/2014/06/Tesla-Logo.png"];
	Company *twitter = [[Company alloc] initWithCompanyName:@"Twitter" andWithCompanyStockSymbol: @"TWTR" andWithCompanyImageName:@"http://simpleicon.com/wp-content/uploads/twitter_3-150x150.png"];

	// Products...
	Product *iPad = [[Product alloc] initWithProductName: @"iPad" andWithProductImageName: @"img-Product-1.png" andWithProductURL: @"https://www.apple.com/ipad-9.7/"];
	Product *iPodTouch = [[Product alloc] initWithProductName: @"iPodTouch" andWithProductImageName: @"img-Product-1.png" andWithProductURL: @"https://www.apple.com/ipod-touch/"];
	Product *iPhone = [[Product alloc] initWithProductName: @"iPhone" andWithProductImageName: @"img-Product-1.png" andWithProductURL: @"https://www.apple.com/iphone/"];
	
	
	

	Product *googleX = [[Product alloc] initWithProductName: @"googleX" andWithProductImageName: @"googlePhone.jpg" andWithProductURL: @"https://www.samsung.com/us/mobile/phones/galaxy-s/samsung-galaxy-s4-verizon-white-frost-16gb-sch-i545zwavzw/"];
	Product *googleY = [[Product alloc] initWithProductName: @"googleY" andWithProductImageName: @"googlePhone.jpg" andWithProductURL:  @"https://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb/"];
	Product *googleZ = [[Product alloc] initWithProductName: @"googleZ" andWithProductImageName: @"googlePhone.jpg" andWithProductURL: @"https://www.apple.com/iphone/"];

	Product *modelS = [[Product alloc] initWithProductName: @"modelS" andWithProductImageName: @"teslaCar.png" andWithProductURL: @"https://www.samsung.com/us/mobile/phones/galaxy-s/samsung-galaxy-s4-verizon-white-frost-16gb-sch-i545zwavzw/"];
	Product *modelX = [[Product alloc] initWithProductName: @"modelX" andWithProductImageName: @"teslaCar.png" andWithProductURL:  @"https://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb/"];
	Product *roadster = [[Product alloc] initWithProductName: @"roadster" andWithProductImageName: @"teslaCar.png" andWithProductURL: @"https://www.google.com/search?q=galaxy+tab&ie=utf-8&oe=utf-8&client=firefox-b-1-ab"];


	Product *aTwitterProduct = [[Product alloc] initWithProductName: @"aTwitterProduct" andWithProductImageName: @"twitterFeed.png" andWithProductURL: @"https://itunes.apple.com/us/app/twitter/id333903271?mt=8"];
	Product *secondTwitterProduct = [[Product alloc] initWithProductName: @"anotherTwitterProduct" andWithProductImageName: @"twitterFeed.png" andWithProductURL:   @"https://www.quora.com/topic/Twitter-API"];
	Product *thirdTwitterProduct = [[Product alloc] initWithProductName: @"aThirdTwitterProduct" andWithProductImageName: @"twitterFeed.png" andWithProductURL: @"https://www.recode.net/2016/10/30/13467684/twitter-product-ideas-wish-list"];

	
	
	_companysList = [[NSMutableArray alloc] init];
	
	

	
	[self addCompany:apple];
	[self addCompany:google];
	[self addCompany:tesla];
	[self addCompany:twitter];

	
	apple.products = [[NSMutableArray alloc] init];
	[self addProduct:iPad companyId:0];
	[self addProduct:iPodTouch companyId:0];
	[self addProduct:iPhone companyId:0];
	
	google.products = [[NSMutableArray alloc] init];
	[self addProduct:googleX companyId:1];
	[self addProduct:googleY companyId:1];
	[self addProduct:googleZ companyId:1];
	
	tesla.products = [[NSMutableArray alloc] init];
	[self addProduct:modelS companyId:2];
	[self addProduct:modelX companyId:2];
	[self addProduct:roadster companyId:2];
	
	twitter.products = [[NSMutableArray alloc] init];
	[self addProduct:aTwitterProduct companyId:3];
	[self addProduct:secondTwitterProduct companyId:3];
	[self addProduct:thirdTwitterProduct companyId:3];

	

	

	

	
	
	
//	[_companysList addObject: google];
//	[_companysList addObject: tesla];
//	[_companysList addObject: twitter];
	
	
	
}

-(void) addCompany:(Company *)company {
	

	CompanyEntity *ce = [NSEntityDescription insertNewObjectForEntityForName:@"CompanyEntity" inManagedObjectContext:context];
	[ce setCompanyId:_companysList.count];
	[ce setCompanyName:company.companyName];
	[ce setCompanyStockSymbol:company.companyStockSymbol];
	[ce setCompanyImageName:company.companyImageName];
	
	//iterate company.products - add each product as productentiry
	
	
	[self saveChanges];
	
	[_companysList addObject: company];

}

-(void) loadAllCompanies
{
	
	NSFetchRequest *request = [[NSFetchRequest alloc]init];
	NSEntityDescription *c = [[model entitiesByName] objectForKey:@"CompanyEntity"];
	[request setEntity:c];
	NSError *error = nil;
	NSSortDescriptor *sortc = [[NSSortDescriptor alloc] initWithKey:@"companyId" ascending:YES];
	[request setSortDescriptors:@[sortc]];

	NSArray *result = [context executeFetchRequest:request error:&error];
	if(!result){
		[NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
	}
	_companysList = [[NSMutableArray alloc]init];
	
	for(CompanyEntity *ce in result){
		
		Company *c = [[Company alloc]init];
		c.companyName = ce.companyName;
		c.companyImageName = ce.companyImageName;
		c.companyStockSymbol = ce.companyStockSymbol;
		[_companysList addObject:c];
		
		c.products = [[NSMutableArray alloc] init];
		
		NSSortDescriptor *sortp = [[NSSortDescriptor alloc] initWithKey:@"productId" ascending:YES];
		NSArray *products = [ce.products sortedArrayUsingDescriptors: @[sortp] ];
		
		for(ProductEntity *pe in products){
			NSLog(@"product id: %hd, name: %@", pe.productId, pe.productName);
			Product *p = [[Product alloc]init];
			p.productName = pe.productName;
			p.productImageName = pe.productImageName;
			p.productURL = pe.productURL;
			[c.products addObject:p];
		}
		
		
	}
	
		NSLog(@"Companies Count %lu", [_companysList count]);
	
	if(result.count==0){
		[self createDemoCompanys];
	}
	
	
}



-(CompanyEntity*)fetchCompanyEntity: (NSInteger)companyId {
	NSFetchRequest *request = [[NSFetchRequest alloc]init];
	NSEntityDescription *c = [[model entitiesByName] objectForKey:@"CompanyEntity"];
	[request setEntity:c];
	NSError *error = nil;
	NSPredicate *p = [NSPredicate predicateWithFormat:@"companyId = %ld", companyId];
	[request setPredicate:p];
	NSArray *result = [context executeFetchRequest:request error:&error];
	return result.firstObject;
}

-(ProductEntity*)fetchProductEntityWithId: (int) productId andCompanyId: (int) companyId {
	
	NSFetchRequest *request = [[NSFetchRequest alloc]init];
	NSEntityDescription *prod = [[model entitiesByName] objectForKey:@"ProductEntity"];
	[request setEntity:prod];
	NSError *error = nil;
	NSPredicate *p = [NSPredicate predicateWithFormat:@"company.companyId = %ld and productId = %ld", companyId, productId];
	[request setPredicate:p];
	NSArray *result = [context executeFetchRequest:request error:&error];
	return result.firstObject;
}

-(void) addProduct: (Product*) product companyId: (int) compId {
	
	Company *company = [self.companysList objectAtIndex:compId];
	
	
	CompanyEntity *ce = [self fetchCompanyEntity:compId];
	
	
	ProductEntity *pe = [NSEntityDescription insertNewObjectForEntityForName:@"ProductEntity" inManagedObjectContext:context];
	
	[pe setProductId: company.products.count];
	[pe setProductName: product.productName];
	[pe setProductImageName: product.productImageName];
	[pe setProductURL: product.productURL];
	[pe setCompany:ce];
	
	[self saveChanges];
	
	[company.products addObject: product];

	
	
	
}

-(void) editProductWithId: (int) productId andCompanyId: (int) companyId product: (NSString*) newName andProductURL: (NSString*) productURL andWithProductImageURL: (NSString*) productImageURL {
	
	Company *currentCompany = self.companysList[companyId];
	Product *currentProduct = currentCompany.products[productId];
	currentProduct.productName = newName;
	currentProduct.productImageName = productImageURL;
	currentProduct.productURL = productURL;
	

	
	ProductEntity *pe = [self fetchProductEntityWithId:productId andCompanyId:companyId];
	
	NSLog(@"product name: %@", pe.productName);
	
	[pe setProductName: currentProduct.productName];
	[pe setProductImageName: currentProduct.productImageName];
	[pe setProductURL: currentProduct.productURL];
	
	
	[self saveChanges];
	
	
	
	
}

-(void) editCompanyWithCompanyId: (int) companyId  andWithCompanyName: (NSString*) companyName andWithStockSymbol: (NSString*) companyStockSymbol andCompanyImageName: (NSString*) companyImageName {

	Company *currentCompany = self.companysList[companyId];
	currentCompany.companyName = companyName;
	currentCompany.companyStockSymbol = companyStockSymbol;
	currentCompany.companyImageName = companyImageName;
	
	//[self.companysList replaceObjectAtIndex:companyId withObject: currentCompany];
	
	CompanyEntity *ce = [self fetchCompanyEntity:companyId];
	[ce setCompanyName:currentCompany.companyName];
	[ce setCompanyStockSymbol:currentCompany.companyStockSymbol];
	[ce setCompanyImageName:currentCompany.companyImageName];
	
	
	[self saveChanges];

	
	
	
}
-(void) deleteProductWithId: (int) productId andCompanyId: (int) companyId{
	
	Company *currentCompany = self.companysList[companyId];
	[currentCompany.products removeObjectAtIndex:productId];
	
	ProductEntity *pe = [self fetchProductEntityWithId:productId andCompanyId:companyId];
	[context deleteObject:pe];
	
	
	[self saveChanges];

}

-(void) deleteCompanyWithCompanyId: (NSInteger) companyId {
	[self.companysList removeObjectAtIndex:companyId];
	
	CompanyEntity *ce = [self fetchCompanyEntity:companyId];
	[context deleteObject:ce];
	
	[self saveChanges];
}


- (void) rearrangeRowsAndSaveNewOrderToCoreDataWithfromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
	
	
	Company *objectToBeMoved = [self.companysList objectAtIndex:fromIndex];
	// remove the object(s) from from index
	[self.companysList removeObjectAtIndex: fromIndex];
	// add the object back from temp to toindex
	[self.companysList insertObject:objectToBeMoved atIndex:toIndex];
	
	NSFetchRequest *request = [[NSFetchRequest alloc]init];
	NSEntityDescription *c = [[model entitiesByName] objectForKey:@"CompanyEntity"];
	[request setEntity:c];
	NSError *error = nil;
	NSArray *result = [context executeFetchRequest:request error:&error];
	
	for(CompanyEntity *ce in result) {
		for(int index = 0; index < self.companysList.count; index++) {
			Company *c = [self.companysList objectAtIndex:index];
			if([c.companyName isEqualToString:ce.companyName]){
				ce.companyId =index;
			}
		}
		
	}
	
	[self saveChanges];

	
}

-(void)initModelContext
{
	model = [NSManagedObjectModel mergedModelFromBundles:nil];
	NSPersistentStoreCoordinator *psc =
	[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
	
	
	NSString *path = [self archivePath];
	NSURL *storeURL = [NSURL fileURLWithPath:path];
	NSError *error = nil;
	
	if(![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
		[NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
	}
	
	context = [[NSManagedObjectContext alloc] init];
	// undo manager code here...
	
	NSUndoManager *anUndoManager = [[NSUndoManager  alloc] init];
	
	[context setUndoManager:anUndoManager];
	[anUndoManager release];
	
	[context setPersistentStoreCoordinator:psc];
	
	
	
}

-(void)undo {  
	[context undo];
	[self loadAllCompanies];
	[self saveChanges];
}

-(void)redo {
	[context redo];
	[self loadAllCompanies];
	[self saveChanges];
}

-(NSString*) archivePath
{
	NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [documentsDirectories objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"store.data"];
}

-(void) saveChanges
{
	NSError *err = nil;
	BOOL successful = [context save:&err];
	if(!successful){
		NSLog(@"Error saving: %@", [err localizedDescription]);
	}
	NSLog(@"Data Saved");
}
@end


