//
//  DictionaryVC.swift
//  Collections
//
//  Created by Данік on 16/03/2023.
//

import Foundation
import UIKit

final class DictionaryViewController: UIViewController {
    
    var titleString: String?
    let dictTasksArr: [String] = ["Find the first contact", "Find the first contact", "Find the last contact", "Find the last contact", "Search for a non-existing element", "Search for a non-existing element"]
    var contactArray: [Contact] = []
    var contactDict: [String:String] = [:]
    var manager = Manager()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleString
        createArrayAndDict()
        layoutSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension DictionaryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dictTasksArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.label.text = dictTasksArr[indexPath.row]
        cell.label.textAlignment = .center
        cell.accessibilityIdentifier = manager.indentificatorForCell(cellNumber: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension DictionaryViewController: UICollectionViewDelegate {
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
                    cell.label.text = self.manager.dictTextWithTime(cellNumber: cellNumber, time: time, elementNumber: elementNumber)
                    // Remove the loading progress bar
                    activityIndicator.removeFromSuperview()
                    // Enable the cell
                    cell.isUserInteractionEnabled = true
                }
            }
        }
    }
}

// MARK: - Configure the Header
extension DictionaryViewController {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: DictionaryHeader.identifier,
                                                                     for: indexPath) as? DictionaryHeader
        else {
            print(fatalError("Fail during dequeueing the header"))
        }
        header.configure()
        header.isUserInteractionEnabled = true
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 75)
    }
}

// MARK: - DictionaryViewController functions
extension DictionaryViewController {
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
            if ind < copyArr.count {
                let contact = copyArr[ind]
                print("Found contact:", contact)
            } else {
                print("Contact not found")
            }
            return 10_000_001
        case 5:
            if let nonExist = copyDict["Name10000001"] {
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
    
    private func layoutSetup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width/2 - 0.5, height: view.frame.size.height/8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView?.register(DictionaryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DictionaryHeader.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .gray
        view.addSubview(collectionView!)
    }
    func createArrayAndDict() {
        DispatchQueue.global(qos: .background).async {
            self.contactArray = self.manager.addContactsToArray()
            self.contactDict = self.manager.addContactstoDict()
        }
    }
}






