//
//  ArrayVC.swift
//  Collections
//
//  Created by Данік on 16/03/2023.
//

import Foundation
import UIKit

class ArrayVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var titleString: String?
    let tasksArr: [String] = ["Insert 1000 elements at the begining of the array one-by-one.", "Insert 1000 elements at the begining of the array.", "Insert 1000 elements in the middle of the array one-by-one.", "Insert 1000 elements in the middle of the array.", "Insert 1000 elements at the end of the array one-by-one.", "Insert 1000 elements at the end of the array.", "Remove 1000 elements at the end of the array one by-one.", "Remove 1000 elements at the end of the array.", "Remove 1000 elements at the beginning of the array one by-one.", "Remove 1000 elements at the beginning of the array.", "Remove 1000 elements in the middle of the array one by-one.", "Remove 1000 elements in the middle of the array."]
    let createArr: [String] = ["Create an Int array with 10_000_000 elements."]
    var manager = Manager()
    var collectionView: UICollectionView?
    var intArray: [Int] = []
    let oneThousandElements = Array(0...999)
    let section1ItemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
    let section2ItemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: 100)
    var numberOfSections = 2
    var numberOfItems = 0
    
    override func viewDidLoad() {
        layoutSetup()
        title = titleString
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    
    
    
    // MARK: - CollectionView Cells
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return createArr.count
        } else {
            return numberOfItems
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.label.text = tasksArr[indexPath.row]
        
        // add accessibility identifier
        if indexPath.section == 0 {
            cell.accessibilityIdentifier = manager.indentificatorForCell(cellNumber: indexPath.row)
        } else {
            cell.accessibilityIdentifier = manager.indentificatorForCell(cellNumber: indexPath.row + 1)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return section1ItemSize
        } else {
            return section2ItemSize
        }
    }
    
    
    

    // MARK: - A View was clicked on
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cellNumber = indexPath.row
        if let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
            // disable the button while the array is being created
            let activityIndicator = manager.showActivityIndicator(sender: cell)
            cell.isUserInteractionEnabled = false
            DispatchQueue.global(qos: .userInitiated).async {
                // Get the start time
                let start = DispatchTime.now()
                // if section 0 was clicked
                if indexPath.section == 0 {
                    self.performOperation(cellNumber: cellNumber)
                    self.numberOfSections = 2
                } else {
                    // if section 1
                    self.performOperation(cellNumber: cellNumber + 1)
                }
                // Get the end time
                let end = DispatchTime.now()
                // Calculate the execution time
                let time = self.manager.calculateExecutionTime(end: end, start: start)
                // Switch back to the main thread to update the UI
                DispatchQueue.main.async {
                    if indexPath.section == 0 {
                        cell.label.text = self.manager.textWithTime(cellNumber: cellNumber, time: time)
                        self.numberOfItems = self.tasksArr.count
                        let indexSet = IndexSet(integer: 1)
                        collectionView.reloadSections(indexSet)
                    } else {
                        cell.label.text = self.manager.textWithTime(cellNumber: cellNumber + 1, time: time)
                    }
                    // set the cell's background color to white
                    cell.backgroundColor = .white
                    // Remove the loading progress bar
                    activityIndicator.removeFromSuperview()
                }
            }
        }
        
    }
    
    
    func performOperation(cellNumber: Int) {
        var copyArr = intArray
        let middleIndex = copyArr.count / 2
        let endIndex = copyArr.count
        
        switch cellNumber {
        case 0:
            intArray = [Int](0..<10000000)
        case 1:
            for element in oneThousandElements {
                copyArr.insert(element, at: 0)
            }
        case 2:
            copyArr.insert(contentsOf: oneThousandElements, at: 0)
        case 3:
            for (index, element) in oneThousandElements.enumerated() {
                copyArr.insert(element, at: middleIndex + index)
            }
        case 4:
            copyArr.insert(contentsOf: oneThousandElements, at: middleIndex)
        case 5:
            for element in self.oneThousandElements {
                copyArr.insert(element, at: endIndex)}
        case 6:
            copyArr.insert(contentsOf: oneThousandElements, at: endIndex)
        case 7:
            for _ in oneThousandElements {
                copyArr.removeLast()}
        case 8:
            copyArr.removeLast(1000)
        case 9:
            for _ in oneThousandElements {
                copyArr.removeFirst()
            }
        case 10:
            copyArr.removeFirst(1000)
        case 11:
            for (index, _) in oneThousandElements.enumerated() {
                copyArr.remove(at: middleIndex + index)
            }
        case 12:
            copyArr.removeSubrange(middleIndex..<middleIndex + 1000)
        default:
            print("wow")
        }
    }
    
    private func layoutSetup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0.5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .gray
        view.addSubview(collectionView!)
    }
    
    
    
}


