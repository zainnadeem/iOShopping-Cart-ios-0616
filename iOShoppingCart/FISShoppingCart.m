//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Zain Nadeem on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents{
    NSUInteger calculateTotal = 0;
    for (FISItem *shoppingItem in self.items){
    calculateTotal = calculateTotal + shoppingItem.priceInCents;
    }
    return calculateTotal;
}


-(void)addItem:(FISItem *)item{
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item{
    
    NSInteger matchingIndex = [self.items indexOfObject:item];
    
    [self.items removeObjectAtIndex: matchingIndex];
    
}
-(void)removeAllItemsLikeItem:(FISItem *)item{
  
    [self.items removeObject:item];

}
-(void)sortItemsByNameAsc{
    NSSortDescriptor *sortByItemAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:YES];
    NSArray *itemsArray = [self.items sortedArrayUsingDescriptors:@[sortByItemAsc]];
    self.items = [itemsArray mutableCopy];
    
    
}
-(void)sortItemsByNameDesc{
    NSSortDescriptor *sortByItemAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:YES];
    
    NSSortDescriptor *sortByItemDesc = [sortByItemAsc reversedSortDescriptor];
    
    NSArray *itemsArray = [self.items sortedArrayUsingDescriptors:@[sortByItemDesc]];
    
    self.items = [itemsArray mutableCopy];
        }
-(void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortByItemAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                    ascending:YES];
    NSArray *itemsArray = [self.items sortedArrayUsingDescriptors:@[sortByItemAsc]];
        self.items = [itemsArray mutableCopy];
    }
-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortByItemAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                    ascending:YES];
        NSSortDescriptor *sortByItemDesc = [sortByItemAsc reversedSortDescriptor];
        NSArray *itemsArray = [self.items sortedArrayUsingDescriptors:@[sortByItemDesc]];
    self.items = [itemsArray mutableCopy];
    
}
-(NSArray *)allItemsWithName:(NSString *)name{
    NSPredicate *filterNamePredicate = [NSPredicate predicateWithFormat:@"name contains %@", name];
    NSArray *itemsArray = [self.items filteredArrayUsingPredicate:filterNamePredicate];
    self.items = [itemsArray mutableCopy];
    return self.items;
}
-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger *)itemWithMinPrice{
    NSPredicate *filterPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %li", itemWithMinPrice];
    NSArray *itemsArray = [self.items filteredArrayUsingPredicate:filterPricePredicate];
    self.items = [itemsArray mutableCopy];
    return self.items;
}
-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger *)itemWithMinPrice{
    NSPredicate *filterPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %li", itemWithMinPrice];
    NSArray *itemsArray = [self.items filteredArrayUsingPredicate:filterPricePredicate];
    self.items = [itemsArray mutableCopy];
    return self.items;
}




@end
