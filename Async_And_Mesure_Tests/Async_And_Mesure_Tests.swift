//
//  Async_And_Mesure_Tests.swift
//  Async_And_Mesure_Tests
//
//  Created by Данік on 16/03/2023.
//

import XCTest

final class Async_And_Mesure_Tests: XCTestCase {
    
    let manager = Manager()
    let contact = Contact.self

    func test_async_addContactsToArray() {
        let exp = expectation(description: "The contacts were added to the array")
        var arr: [Contact] = []
        DispatchQueue.main.async {
            arr = self.manager.addContactsToArray()
            XCTAssertNotNil(arr)
            exp.fulfill()
            print("Expectation was fulfilled")
        }
        wait(for: [exp], timeout: 10.0)
    }
    
    func test_async_addContactsToDict() {
        let exp = expectation(description: "The contacts were added to the dictionary")
        var dict: [String:String] = [:]
        DispatchQueue.main.async {
            dict = self.manager.addContactstoDict()
            XCTAssertNotNil(dict)
            exp.fulfill()
            print("Expectation was fulfilled")
        }
        wait(for: [exp], timeout: 10.0)
    }
    
    func test_measure_addContactsToArray() {
        var arr: [Contact] = []
        measure {
            arr = manager.addContactsToArray()
        }
    }
    
    func test_measure_addContactsToDictionary() {
        var dict: [String:String] = [:]
        measure {
            dict = manager.addContactstoDict()
        }
    }
}

