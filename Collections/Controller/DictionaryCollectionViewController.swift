//
//  DictionaryCollectionViewController.swift
//  Collections
//
//  Created by Данік on 09/03/2023.
//

import UIKit

class DictionaryCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    
    let dictTasksArr: [String] = ["Find the first contact", "Find the first contact", "Find the last contact", "Find the last contact", "Search for a non-existing element", "Search for a non-existing element"]
    var contactArray: [Contact] = []
    var contactDict: [String:String] = [:]
    var manager = Manager()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.addContactsToArray()
            self.addContactstoDict()
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.height/8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0.5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView?.register(DictionaryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DictionaryHeader.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .gray
        view.addSubview(collectionView!)
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dictTasksArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.label.text = dictTasksArr[indexPath.row]
        return cell
    }
    
    
    
    // MARK: - CollectionView Header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: DictionaryHeader.identifier,
                                                                     for: indexPath) as! DictionaryHeader

        header.configure()
        header.isUserInteractionEnabled = true
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }
    
    
    
    // MARK: - A View was clicked on
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var elementNumber = 0
        let cellNumber = indexPath.row
        if let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
            // disable the button
            let activityIndicator = manager.showActivityIndicator(sender: cell)
            // disable the button
            cell.isUserInteractionEnabled = false
            DispatchQueue.global(qos: .userInitiated).async {
                // Get the start time
                let start = DispatchTime.now()
                // perform operation
                elementNumber = self.performOperation(cellNumber: cellNumber)
                // Get the end time
                let end = DispatchTime.now()
                // Calculate the execution time
                let time = self.manager.calculateExecutionTime(end: end, start: start)
                // Switch back to the main thread to update the UI
                DispatchQueue.main.async {
                    cell.label.text = self.textWithTime(cellNumber: cellNumber, time: time, elementNumber: elementNumber)
                    // Remove the loading progress bar
                    activityIndicator.removeFromSuperview()
                    // Enable the cell
                    cell.isUserInteractionEnabled = true
                }
            }
            
        }
        
    }
    
    func performOperation(cellNumber: Int) -> Int {
        let copyArr = contactArray
        let copyDict = contactDict
        switch cellNumber {
        case 0:
            let firstArrElement = copyArr.first
            return 0
        case 1:
            let firstFictElement = copyDict.first
            return 0
        case 2:
            let lastArrElement = copyArr.last
            return copyArr.count
        case 3:
            if let lastDictElement = copyDict.keys.sorted().last.map({ ($0, copyDict[$0]!) }) {
                print(lastDictElement.0)
                return copyDict.count
            }
        case 4:
            let ind = 10_000_001
            if ind < self.contactArray.count {
                let contact = self.contactArray[ind]
                print("Found contact:", contact)
            } else {
                print("Contact not found")
            }
            return 10_000_001
        case 5:
            if let nonExist = self.contactDict["Name10000001"] {
                print("The \(nonExist) element exists")
            } else {
                print("The element does't exist")
            }
            return 10_000_001
        default:
            print("Hello World")
            
        }
        return 0
    }
    func textWithTime(cellNumber: Int, time: Double, elementNumber: Int) -> String {
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

}
