//
//  ForTestCodeTests.swift
//  ForTestCodeTests
//
//  Created by Dev on 19/12/2566 BE.
//

import XCTest
@testable import ForTestCode //Name Project

final class ForTestCodeTests: XCTestCase {

    func test_Deposit() throws {
        let bankAcc = BankAccount(balance: 1000, amount: 0)
        let result = bankAcc.deposit(amount: 100)
        XCTAssertEqual(result, 1100)
    }
    
    func test_withdraw() throws{
        let bankAcc = BankAccount(balance: 1000, amount: 0)
        let result = bankAcc.withdraw(amount: 100)
        XCTAssertEqual(result, 900)
    }
}
