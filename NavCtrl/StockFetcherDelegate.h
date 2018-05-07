//
//  StockFetcherDelegate.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/30/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//


#ifndef StockFetcherDelegate_h
#define StockFetcherDelegate_h


#endif /* StockFetcherDelegate_h */

#import  <Foundation/Foundation.h>


@protocol StockFetcherDelegate <NSObject>

-(void)stockFetchSuccessWithPriceString;

@optional
-(void)stockFetchDidFailWithError: (NSError*) error;
-(void)stockFetchDidStart;

@end
