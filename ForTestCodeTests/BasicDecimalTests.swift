//
//  BasicDecimalTests.swift
//  BasicDecimalTests
//
//  Created by Dev on 25/12/2566 BE.
//

import XCTest
@testable import ForTestCode

final class BasicDecimalTests: XCTestCase {

    func testMoneyFormatterWholeNumber() throws {
      XCTAssertEqual(Decimal(string: "0")?.moneyString, "0.00")
      XCTAssertEqual(Decimal(string: "1")?.moneyString, "1.00")
      XCTAssertEqual(Decimal(string: "2")?.moneyString, "2.00")
      XCTAssertEqual(Decimal(string: "123")?.moneyString, "123.00")
      XCTAssertEqual(Decimal(string: "-2")?.moneyString, "-2.00")
    }
    
    func testMoneyFormatterDecimalNumberWithOneDecimalPlace() throws {
      XCTAssertEqual(Decimal(string: "1.1")?.moneyString, "1.10")
      XCTAssertEqual(Decimal(string: "1.2")?.moneyString, "1.20")
      XCTAssertEqual(Decimal(string: "-1.2")?.moneyString, "-1.20")
    }
    
    func testMoneyFormatterDecimalNumberWithTwoDecimalPlace() throws {
      XCTAssertEqual(Decimal(string: "1.11")?.moneyString, "1.11")
      XCTAssertEqual(Decimal(string: "1.12")?.moneyString, "1.12")
      XCTAssertEqual(Decimal(string: "-1.12")?.moneyString, "-1.12")
    }
    
    func testMoneyFormatterDecimalNumberWithAnyDecimalPlaces() throws {
      XCTAssertEqual(Decimal(string: "1.111")?.moneyString, "1.11")
      XCTAssertEqual(Decimal(string: "1.119")?.moneyString, "1.11")
      XCTAssertEqual(Decimal(string: "1.23456789")?.moneyString, "1.23")
      XCTAssertEqual(Decimal(string: "-1.23456789")?.moneyString, "-1.24")
    }
}
