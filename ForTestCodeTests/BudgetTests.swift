//
//  BudgetTests.swift
//  ForTestCodeTests
//
//  Created by Dev on 25/12/2566 BE.
//

import XCTest
@testable import ForTestCode
//MARK: Test Func
final class BudgetTests: XCTestCase {

    func testBudgetContainsWeeklyRemaining(){
        let arrBudget:[Decimal] = [0,1,321,444]
        arrBudget.forEach { num in
            let budget = Budget(total: num)
            XCTAssertEqual(budget.weeklyRemaining, num)
        }
    }
    
    func testBudgetContainsDailyRemaining(){
        var arrBudget:[Decimal] = [0,7,14,70]
        arrBudget.forEach { num in
            let budget = Budget(total: num)
            XCTAssertEqual(budget.dailyRemaining, num/7, "DailyRemaining is not \(num/7)")
        }
    }
    
    func testTransactionDeductsFormWeeklyRemaining(){
        let budget = Budget(total: 10)
        budget.addTransaction(amount: 0, timestamp: Date())
        XCTAssertEqual(budget.weeklyRemaining, 10)
        
        budget.addTransaction(amount: 1, timestamp: Date())
        XCTAssertEqual(budget.weeklyRemaining, 9)
        
        budget.addTransaction(amount: 2, timestamp: Date())
        XCTAssertEqual(budget.weeklyRemaining, 7)
    }
    
    func testTransactionDeductsFormDailyRemaining(){
        let budget = Budget(total: 70)
        budget.addTransaction(amount: 0, timestamp: Date())
        XCTAssertEqual(budget.dailyRemaining, 10)
        XCTAssertEqual(budget.weeklyRemaining, 70)
        
        budget.addTransaction(amount: 1, timestamp: Date())
        XCTAssertEqual(budget.dailyRemaining, 9)
        
        budget.addTransaction(amount: 3, timestamp: Date())
        XCTAssertEqual(budget.dailyRemaining, 6)
    }
}
