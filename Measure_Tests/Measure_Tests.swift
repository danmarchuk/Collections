//
//  Measure_Tests.swift
//  Measure_Tests
//
//  Created by Данік on 14/03/2023.
//

import XCTest

final class Measure_Tests: XCTestCase {
    
    let manager = Manager()
    let contact = Contact.self

    
    func test_addContactsToArray() {
        measure {
            print(manager.addContactsToArray())
        }
    }
    
    func test_addContactsToDictionary() {
        measure {
            print(manager.addContactstoDict())
        }
    }

}
