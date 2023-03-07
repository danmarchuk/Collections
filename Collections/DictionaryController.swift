//
//  DictionaryController.swift
//  Collections
//
//  Created by Данік on 05/03/2023.
//

import UIKit

class DictionaryController: UIViewController {
    var contactArray: [Contact] = []
    var contactDict: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.addContactsToArray()
            self.addContactstoDict()
        }
        
    }
    
    @IBAction func arrFindFirstCon(_ sender: UIButton) {
        findFirstArrElement(sender: sender)
    }
    
    @IBAction func arrFindLastCon(_ sender: UIButton) {
        findLastArrElement(sender: sender)
        
    }
    
    @IBAction func arrSearchNonExist(_ sender: UIButton) {
        findNonExistingArrElement(sender: sender)
    }
    
    @IBAction func dictFindFirst(_ sender: UIButton) {
        findFirstDictElement(sender: sender)
        
    }
    
    @IBAction func dictFindLast(_ sender: UIButton) {
        findLastDictElement(sender: sender)
    }
    
    
    @IBAction func dictSearchNonExist(_ sender: UIButton) {
        findNonExistingDictElement(sender: sender)
        
    }
    
    
 
    
    func addContactsToArray() {
        for i in 0..<10_000_000 {
            let name = "Name\(i)"
            let phone = String(format: "%07d", i)
            contactArray.append(Contact(name: name, phone: phone))
        }
    }
    
    func addContactstoDict() {
        for i in 0..<10_000_000 {
            let name = "Name\(i)"
            let phone = String(format: "%07d", i)
            contactDict[name] = phone
        }
    }
    
    func findFirstArrElement(sender: UIButton) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            
            let firstEl = self.contactArray.first
            
            let end = DispatchTime.now()
            
            let time = self.calculateExecutionTime(end: end, start: start)
            
            DispatchQueue.main.async {
                sender.setTitle("First element search time: \(time) ms. Result number: 0", for: .normal)
            }
        }
    }
    
    func findLastArrElement(sender: UIButton) {
        var lastIndex = 0
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            
            if let lastEl = self.contactArray.last {
                lastIndex = self.contactArray.firstIndex(of: lastEl)!
            }
            
            let end = DispatchTime.now()
            
            let time = self.calculateExecutionTime(end: end, start: start)
            
            DispatchQueue.main.async {
                sender.setTitle("Last element search time: \(time) ms. Result number: \(lastIndex)", for: .normal)
            }
        }
        
    }
    
    func findNonExistingArrElement(sender: UIButton) {
        let ind = 10_000_001
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            if ind < self.contactArray.count {
                let contact = self.contactArray[ind]
                print("Found contact:", contact)
            } else {
                print("Contact not found")
            }
            
            let end = DispatchTime.now()
            
            let time = self.calculateExecutionTime(end: end, start: start)
            
            DispatchQueue.main.async {
                sender.setTitle("Non-existing element search time: \(time) ms. Result number: 10 000 001", for: .normal)
            }
        }
        
    }
    
    func findFirstDictElement(sender: UIButton) {
        var firstKey = ""
        var firstVal = ""
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            
            if let firstKeyValue = self.contactDict.keys.min(), let firstValue = self.contactDict[firstKeyValue] {
                firstKey = firstKeyValue
                firstVal = firstValue
            } else {
                print("The dictionary is empty.")
            }
            
            let end = DispatchTime.now()
            
            let time = self.calculateExecutionTime(end: end, start: start)
            
            DispatchQueue.main.async {
                sender.setTitle("First element search time: \(time) ms. First key: \(firstKey), first value: \(firstVal)", for: .normal)
            }
        }
    }
    
    func findLastDictElement(sender: UIButton) {
        
        var lastKey = ""
        var lastVal = ""
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            
            if let last = self.contactDict.keys.sorted().last.map({ ($0, self.contactDict[$0]!) }) {
                lastKey = last.0
                lastVal = last.1
            } else {
                print("The dictionary is empty.")
            }
            
            let end = DispatchTime.now()
            
            let time = self.calculateExecutionTime(end: end, start: start)
            
            DispatchQueue.main.async {
                sender.setTitle("Last element search time: \(time) ms. Last key: \(lastKey), last value: \(lastVal)", for: .normal)
            }
        }
        
    }
    
    func findNonExistingDictElement(sender: UIButton) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            
            if let nonExist = self.contactDict["Name10000001"] {
                print("The \(nonExist) element exists")
            } else {
                print("The element does't exist")
            }
            
            let end = DispatchTime.now()
            
            let time = self.calculateExecutionTime(end: end, start: start)
            
            DispatchQueue.main.async {
                sender.setTitle("Non-existing element search time: \(time) ms. )", for: .normal)
            }
        }
        
    }
    
    
    func calculateExecutionTime(end: DispatchTime, start: DispatchTime) -> Double {
        let executionTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
        let roundedTime = round(executionTime * 1000) / 1000.0
        return roundedTime
    }
    
}
