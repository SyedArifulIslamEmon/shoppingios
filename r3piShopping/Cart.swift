//
//  Cart.swift
//  r3piShopping
//
//  Created by Sean Denton on 7/31/16.
//  Copyright © 2016 Sean Denton. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Cart: NSObject {
    var myCart: NSMutableArray = []
    var cartTotal : NSDecimalNumber = 0.00
    
    public class var sharedInstance : Cart {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : Cart? = nil
            
            
            
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Cart()
            
            
            
        }
        
        return Static.instance!
    }

    
    override init(){
       
        
    }
    
    
    public func clearCart(){
        self.myCart = []
    }
    
    public func addToCart(item:Product, count:Int){
       let cartDict:NSDictionary = ["item": item, "count": count]
        self.myCart.addObject(cartDict)
        calculateTotal()
    }
    
    public func removeItemFromCart(cartItem:NSDictionary){
        self.myCart.removeObject(cartItem)
        calculateTotal()
    }
    
    func calculateTotal(){
        self.cartTotal = 0
        for cartItem in myCart{
            let theItem : Product = cartItem["item"] as! Product
            let itemCount : Int = cartItem["count"] as! Int
            
            self.cartTotal = self.cartTotal.decimalNumberByAdding(theItem.price!.decimalNumberByMultiplyingBy(NSDecimalNumber.init(integer: itemCount)))
                    }
        
        NSNotificationCenter.defaultCenter().postNotificationName("newCartTotal", object: nil)
    }
    
}