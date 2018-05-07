//
//  StockFetcher.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/30/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "StockFetcher.h"
#import "Company.h"
#import "DataAccessObject.h"

@implementation StockFetcher

//calling delegate methods during the fetching process so that the delegate can respond accordingly

-(void)fetchStockPrice {
	
	//responds to selector is necessary for optional methods in our delegate protocol "StockFetcherDelegate", if our delegate does not implement them and we try to call them.. the app will crash
	
	if ([self.delegate respondsToSelector:@selector(stockFetchDidStart)]) {
		[self.delegate stockFetchDidStart];
	}
	

	DataAccessObject *dao = [DataAccessObject sharedDAO];
	NSMutableArray<Company*> *companies = [dao companysList];
	
	
	
	NSMutableArray<NSString*> *symbolList = [[NSMutableArray alloc] init];
	
	for (Company *company in companies)  {
		
		[symbolList addObject: company.companyStockSymbol];
		
	}
	
	NSString *stringOfCompanyStockSymbols = [symbolList componentsJoinedByString:@","];
	
	// ,AAPL,MSFT
	
	NSString *urlString = [NSString stringWithFormat:@"https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=%@&interval=1min&apikey=0OQEWP77RU8JBMBZ",stringOfCompanyStockSymbols];
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		
		if (error) {
			if ([self.delegate respondsToSelector:@selector(stockFetchDidFailWithError:)]) {
				
				//we are not on the main queue at this point so it is important to dispatch blocks
				dispatch_async(dispatch_get_main_queue(), ^{
					
					//communicate with the delegate that we have failed and give it the error object for further handling
					[self.delegate stockFetchDidFailWithError:error];
				});
			}
		} else {
			NSString *priceString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
			dispatch_async(dispatch_get_main_queue(), ^{
				
				//communicate with the delegate that we have succeeded in fetching a stock price and giving the delegate the stockprice for further processing
				
				NSLog(@"%@", priceString);
				
				NSError *error = nil;
				NSDictionary *dictJSON = [NSJSONSerialization JSONObjectWithData:data
																		   options:0
																			 error:&error];
				
				
				NSLog (@"%@", dictJSON);
				
				for(NSDictionary *stockQuote in dictJSON[@"Stock Quotes"]){
					
					NSString *stockPrice = stockQuote[@"2. price"];
					NSString *stockSymbol = stockQuote[@"1. symbol"];
					
//					for (Company *company in companies)  {
//
//						if([company.companyStockSymbol isEqualToString:stockSymbol]){
//							company.companyStockPrice = stockPrice;
//
//						}
//
//					}
					int i;
					for (i = 0; i < companies.count; i++)  {
		
						if([companies[i].companyStockSymbol isEqualToString:stockSymbol]){
							
							[[dao companysList] objectAtIndex: i].companyStockPrice   = stockPrice;
//							company.companyStockPrice = stockPrice;
						}

					}
				}
				
						[self.delegate stockFetchSuccessWithPriceString];


			});
			
		}
	}];
	[task resume];
}


@end
