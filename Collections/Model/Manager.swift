//
//  Manager.swift
//  Collections
//
//  Created by Данік on 07/03/2023.
//

import UIKit
struct Manager {
    
    // MARK: - MenuVC functions
    
    var random: Int {
        return Int.random(in: 10000..<100000)
    }
    
    // MARK: - shared functions
    
    func calculateExecutionTime(end: DispatchTime, start: DispatchTime) -> Double {
        let executionTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
        let roundedTime = round(executionTime * 1000) / 1000.0
        return roundedTime
    }
    
    func showActivityIndicator (sender: UICollectionReusableView) -> UIActivityIndicatorView {
        // Show a loading progress bar inside the button
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        sender.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: sender.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: sender.centerYAnchor)
        ])
        return activityIndicator
    }
    
    // MARK: - ArrayCollectionViewController functions
    
    func textWithTime(cellNumber: Int, time: Double) -> String {
        switch cellNumber {
        case 0:
            return "Array creation time \(time)"
        case 1...6:
            return "Insertion time \(time)"
        case 7...12:
            return "Removal time \(time)"
        default:
            return "Error"
        }
    }
    
    func indentificatorForCell(cellNumber: Int) -> String {
        switch cellNumber {
        case 0:
            return "Cell_0"
        case 1:
            return "Cell_1"
        case 2:
            return "Cell_2"
        case 3:
            return "Cell_3"
        case 4:
            return "Cell_4"
        case 5:
            return "Cell_5"
        case 6:
            return "Cell_6"
        case 7:
            return "Cell_7"
        case 8:
            return "Cell_8"
        case 9:
            return "Cell_9"
        case 10:
            return "Cell_10"
        case 11:
            return "Cell_11"
        case 12:
            return "Cell_12"
        default:
            print("wow")
        }
        return "wow"
    }

    
    
    
    // MARK: - SetController functions
    
    func unmatchedCharacters(string1: String, string2: String) -> String {
        var unmatchedCharacters: String = ""
        let minLength = min(string1.count, string2.count)
        
        for i in 0..<minLength {
            let char1 = string1[string1.index(string1.startIndex, offsetBy: i)]
            let char2 = string2[string2.index(string2.startIndex, offsetBy: i)]
            if char1 != char2 {
                unmatchedCharacters.append(char1)
                unmatchedCharacters.append(char2)
            }
        }
        
        let remainingChars1 = string1.dropFirst(minLength)
        let remainingChars2 = string2.dropFirst(minLength)
        unmatchedCharacters.append(contentsOf: remainingChars1)
        unmatchedCharacters.append(contentsOf: remainingChars2)
        return unmatchedCharacters
    }
    
    
    func uniqueChars(string1: String, string2: String) -> String {

        var nonMatchingChars = ""

        for (index, char) in string1.enumerated() {
            if index >= string2.count || char != string2[string2.index(string2.startIndex, offsetBy: index)] {
                nonMatchingChars.append(char)
            }
        }

        if string2.count > string1.count {
            nonMatchingChars.append(String(string2[string2.index(string2.startIndex, offsetBy: string1.count)...]))
        }

        return nonMatchingChars
    }
    
    // MARK: - DictionaryCollectionVC methods
    
    func dictTextWithTime(cellNumber: Int, time: Double, elementNumber: Int) -> String {
        switch cellNumber {
        case 0...1:
            return "First element search time: \(time) ms. Result Number \(elementNumber)"
        case 2...3:
            return "Last element search time: \(time) ms. Result Number \(elementNumber)"
        case 4...5:
            return "Non-existing element search time: \(time) ms. Result Number \(elementNumber)"
        default:
            return "Error"
        }
        
    }
    
    func addContactsToArray() -> Array<Contact> {
        var contactArray: [Contact] = []
        for i in 0..<10_000_000 {
            let name = "Name\(i)"
            let phone = String(format: "%07d", i)
            contactArray.append(Contact(name: name, phone: phone))
        }
        return contactArray
    }
    
    func addContactstoDict() -> Dictionary<String, String> {
        var contactDict: [String:String] = [:]
        for i in 0..<10_000_000 {
            let name = "Name\(i)"
            let phone = String(format: "%07d", i)
            contactDict[name] = phone
        }
        return contactDict
    }
}
