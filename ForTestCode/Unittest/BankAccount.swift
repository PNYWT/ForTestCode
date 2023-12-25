//
//  BankAccount.swift
//  ForTestCode
//
//  Created by Dev on 19/12/2566 BE.
//

import Foundation

public class BankAccount{
    
    private var balance:Int = 0
    private var amount:Int = 0
    
    init(balance:Int, amount:Int) {
        self.balance = balance
        self.amount = amount
    }
    
    func deposit(amount:Int) -> Int{
        self.balance = self.balance + amount
        return self.balance
    }
    
    func withdraw(amount:Int) -> Int{
        self.balance = self.balance - amount
        return self.balance
    }
}
