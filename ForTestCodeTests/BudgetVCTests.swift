//
//  BudgetVCTests.swift
//  ForTestCodeTests
//
//  Created by Dev on 25/12/2566 BE.
//

import XCTest
@testable import ForTestCode
//MARK: Test Func + UI
final class BudgetVCTests: XCTestCase {
    
    var vcBudget:BudgetVC!
    
    override func setUpWithError() throws {
        super.setUp()
        vcBudget = BudgetVC()
        vcBudget.setupView()
        // ทำการ setup หรือ initialization ที่จำเป็นต่อ viewControllerB
    }

    func testCreatingAnewBudgetUpdateRemainingLabel(){
        let textField = vcBudget.totalBudgetTF!
        textField.text = "100"
        _ = textField.delegate?.textFieldShouldReturn?(textField)
        
        let budget = vcBudget.budget
        XCTAssertEqual(vcBudget.weeklyRemainingLabel.text, budget?.weeklyRemaining.moneyString)
        XCTAssertEqual(vcBudget.todayRemainingLabel.text, budget?.dailyRemaining.moneyString)
    }
    
    func testCreatingATransactionUpdateRemainingLabel(){
        let budget = Budget(total: 70)
        budget.addTransaction(amount: 5, timestamp: Date())
        
        let textFieldA = vcBudget.totalBudgetTF!
        textFieldA.text = "70"
        _ = textFieldA.delegate?.textFieldShouldReturn?(textFieldA)
        
        let textFieldB = vcBudget.transactionTF!
        textFieldB.text = "5"
        _ = textFieldB.delegate?.textFieldShouldReturn?(textFieldB)
        XCTAssertEqual(vcBudget.weeklyRemainingLabel.text, budget.weeklyRemaining.moneyString)
        XCTAssertEqual(vcBudget.todayRemainingLabel.text, budget.dailyRemaining.moneyString)
    }
}

