//
//  Collections_Unit_Tests.swift
//  Collections_Unit_Tests
//
//  Created by Данік on 16/03/2023.
//

import XCTest

final class ManagerUnitTests: XCTestCase {
    
    let manager = Manager()
    
    func test_textWithTime_function_case0() {
        let textWithTime =  manager.textWithTime(cellNumber: 0, time: 12.12345)
        print(textWithTime)
        let expectedResult = "Array creation time 12.12345"
        XCTAssertEqual(textWithTime, expectedResult)
    }
    
    func test_should_fail_textWithTime_function_case0() {
        let textWithTime =  manager.textWithTime(cellNumber: 0, time: 12.12345)
        print(textWithTime)
        let expectedResult = "Array creation time 0"
        XCTAssertEqual(textWithTime, expectedResult)
    }

    func test_textWithTime_function_case1_6() {
        let textWithTime =  manager.textWithTime(cellNumber: 1, time: 12.12345)
        let expectedResult = "Insertion time 12.12345"
        XCTAssertEqual(textWithTime, expectedResult)
    }
    
    func test_should_fail_textWithTime_function_case1_6() {
        let textWithTime =  manager.textWithTime(cellNumber: 1, time: 12.12345)
        let expectedResult = "Insertion time 13.1313"
        XCTAssertEqual(textWithTime, expectedResult)
    }
    
    func test_textWithTime_function_case7_12() {
        let textWithTime =  manager.textWithTime(cellNumber: 7, time: 12.12345)
        let expectedResult = "Removal time 12.12345"
        XCTAssertEqual(textWithTime, expectedResult)
    }
    
    func test_should_fail_textWithTime_function_case7_12() {
        let textWithTime =  manager.textWithTime(cellNumber: 7, time: 12.345)
        let expectedResult = "Removal time 12.12345"
        XCTAssertEqual(textWithTime, expectedResult)
    }

    func test_unmatchedCharacters() {
        let unmatchedCharacters = manager.unmatchedCharacters(string1: "12345", string2: "12")
        let expectedResult = "345"
        XCTAssertEqual(unmatchedCharacters, expectedResult)
    }
    
    func test_should_fail_unmatchedCharacters() {
        let unmatchedCharacters = manager.unmatchedCharacters(string1: "12345", string2: "12")
        let expectedResult = "3455"
        XCTAssertEqual(unmatchedCharacters, expectedResult)
    }
    
    func test_uniqueChars() {
        let unmatchedCharacters = manager.unmatchedCharacters(string1: "12345", string2: "1289")
        let expectedResult = "38495"
        XCTAssertEqual(unmatchedCharacters, expectedResult)
    }
    
    func test_should_fail_uniqueChars() {
        let unmatchedCharacters = manager.unmatchedCharacters(string1: "12345", string2: "1289")
        let expectedResult = "395"
        XCTAssertEqual(unmatchedCharacters, expectedResult)
    }
    
    func test_dictTextWithTime_case_0_1() {
        let dictTextWithTime = manager.dictTextWithTime(cellNumber: 1, time: 2.0, elementNumber: 2)
        let expectedResult = "First element search time: 2.0 ms. Result Number 2"
        XCTAssertEqual(dictTextWithTime, expectedResult)
    }
    
    func test_should_fail_dictTextWithTime_case_0_1() {
        let dictTextWithTime = manager.dictTextWithTime(cellNumber: 1, time: 2.0, elementNumber: 2)
        let expectedResult = "First element search time: 2.0 ms. Result Number 3"
        XCTAssertEqual(dictTextWithTime, expectedResult)
    }
    
    func test_dictTextWithTime_case_2_3() {
        let dictTextWithTime = manager.dictTextWithTime(cellNumber: 2, time: 2.0, elementNumber: 100)
        let expectedResult = "Last element search time: 2.0 ms. Result Number 100"
        XCTAssertEqual(dictTextWithTime, expectedResult)
    }
    
    func test_should_fail_dictTextWithTime_case_2_3() {
        let dictTextWithTime = manager.dictTextWithTime(cellNumber: 2, time: 2.0, elementNumber: 100)
        let expectedResult = "Last element search time: 2.0 ms. Result Number 200000"
        XCTAssertEqual(dictTextWithTime, expectedResult)
    }
    
    func test_dictTextWithTime_case_4_5() {
        let dictTextWithTime = manager.dictTextWithTime(cellNumber: 4, time: 2.0, elementNumber: 200)
        let expectedResult = "Non-existing element search time: 2.0 ms. Result Number 200"
        XCTAssertEqual(dictTextWithTime, expectedResult)
    }
    
    func test_should_fail_dictTextWithTime_case_4_5() {
        let dictTextWithTime = manager.dictTextWithTime(cellNumber: 4, time: 2.0, elementNumber: 200)
        let expectedResult = "Non-existing element search time: 2.0 ms. Result Number 20000000"
        XCTAssertEqual(dictTextWithTime, expectedResult)
    }
    
    func test_calculateExecutionTime() {
        let executionTime = manager.calculateExecutionTime(end: DispatchTime(uptimeNanoseconds: 9000000000000), start: DispatchTime(uptimeNanoseconds: 1000000000000))
        let expectedResult = 8000.0
        XCTAssertEqual(executionTime, expectedResult)
    }
    
    func test_should_fail_calculateExecutionTime() {
        let executionTime = manager.calculateExecutionTime(end: DispatchTime(uptimeNanoseconds: 9000000000000), start: DispatchTime(uptimeNanoseconds: 1000000000000))
        let expectedResult = 98000.0
        XCTAssertEqual(executionTime, expectedResult)
    }
}


