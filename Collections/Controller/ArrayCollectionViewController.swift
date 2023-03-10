//
//  ArrayCollectionViewController.swift
//  Collections
//
//  Created by Данік on 08/03/2023.
//

import UIKit

class ArrayCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    let tasksArr: [String] = ["Insert 1000 elements at the begining of the array one-by-one.", "Insert 1000 elements at the begining of the array.", "Insert 1000 elements in the middle of the array one-by-one.", "Insert 1000 elements in the middle of the array.", "Insert 1000 elements at the end of the array one-by-one.", "Insert 1000 elements at the end of the array.", "Remove 1000 elements at the end of the array one by-one.", "Remove 1000 elements at the end of the array.", "Remove 1000 elements at the beginning of the array one by-one.", "Remove 1000 elements at the beginning of the array.", "Remove 1000 elements in the middle of the array one by-one.", "Remove 1000 elements in the middle of the array."]
    var manager = Manager()
    var collectionView: UICollectionView?
    let intArray = [Int](0..<10000000)
    let oneThousandElements = Array(0...999)
    
    override func viewDidLoad() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.height/8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0.5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .gray
        view.addSubview(collectionView!)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    
    
    
    // MARK: - CollectionView Cells
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tasksArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.label.text = tasksArr[indexPath.row]
        
        return cell
    }
    
    // MARK: - CollectionView Header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: Header.identifier,
                                                                     for: indexPath) as! Header

        header.configure()
        header.isUserInteractionEnabled = true
        return header
        

        
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
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
                // create an array
                self.performOperation(cellNumber: cellNumber)
                // Get the end time
                let end = DispatchTime.now()
                // Calculate the execution time
                let time = self.manager.calculateExecutionTime(end: end, start: start)
                // Switch back to the main thread to update the UI
                DispatchQueue.main.async {
                    cell.label.text = self.textWithTime(cellNumber: cellNumber, time: time)
                    // Remove the loading progress bar
                    activityIndicator.removeFromSuperview()
                    // Enable the cell
                    cell.isUserInteractionEnabled = true
                }
            }
        }
        
    }
    
    func textWithTime(cellNumber: Int, time: Double) -> String {
        switch cellNumber {
        case 0...5:
            return "Insertion time \(time)"
        case 6...11:
            return "Removal time \(time)"
        default:
            return "Error"
        }
    }
    
    func performOperation(cellNumber: Int) {
        var copyArr = intArray
        let middleIndex = copyArr.count / 2
        let endIndex = copyArr.count
        
        switch cellNumber {
        case 0:
            for element in oneThousandElements {
                copyArr.insert(element, at: 0)
            }
        case 1:
            copyArr.insert(contentsOf: oneThousandElements, at: 0)
        case 2:
            for (index, element) in oneThousandElements.enumerated() {
                copyArr.insert(element, at: middleIndex + index)
            }
        case 3:
            copyArr.insert(contentsOf: oneThousandElements, at: middleIndex)
        case 4:
            for element in self.oneThousandElements {
                copyArr.insert(element, at: endIndex)}
        case 5:
            copyArr.insert(contentsOf: oneThousandElements, at: endIndex)
        case 6:
            for _ in oneThousandElements {
                copyArr.removeLast()}
        case 7:
            copyArr.removeLast(1000)
        case 8:
            for _ in oneThousandElements {
                copyArr.removeFirst()
            }
        case 9:
            copyArr.removeFirst(1000)
        case 10:
            for (index, _) in oneThousandElements.enumerated() {
                copyArr.remove(at: middleIndex + index)
            }
        case 11:
            copyArr.removeSubrange(middleIndex..<middleIndex + 1000)
        default:
            print("wow")
        }
        
    }
    
    
}
