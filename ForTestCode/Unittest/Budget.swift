//
//  Budget.swift
//  ForTestCode
//
//  Created by Dev on 25/12/2566 BE.
//
// Code by -> TDD and Unit Testing in iOS | Part 1 Stateless Objects, ch.Sam Meech-Ward
import Foundation

extension Decimal {
    var moneyString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.roundingMode = .floor
        return numberFormatter.string(from: self as NSDecimalNumber) ?? ""
    }
}

class Budget{
    
    //setter
    var weeklyRemaining:Decimal{
        return _weeklyRemaining
    }
    var dailyRemaining:Decimal{
        return _dailyRemaining
    }
    
    //getter
    private var _weeklyRemaining:Decimal
    private var _dailyRemaining:Decimal
    
    init(total:Decimal) {
        _weeklyRemaining = total
        _dailyRemaining = total/7
    }
    
    func addTransaction(amount:Decimal, timestamp:Date){
        _weeklyRemaining -= amount
        _dailyRemaining -= amount
    }
}
