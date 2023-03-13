//
//  MenuController.swift
//  Collections
//
//  Created by Данік on 04/03/2023.
//

import Foundation
import UIKit

class MenuController:  UITableViewController {
    
    let menuItems = ["Array", "Set", "Dictionary"]
    
    let manager = Manager()
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return menuItems.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let destinationVC = ArrayCollectionViewController()

            destinationVC.titleString = "Array \(manager.random)"
            navigationController?.pushViewController(destinationVC, animated: true)
        case 1:
            let storydoard = UIStoryboard(name: "Set", bundle: nil)
            let destinationVC = storydoard.instantiateViewController(withIdentifier: "SetStoryboard") as! SetController
            destinationVC.titleString = "Set \(manager.random)"
            navigationController?.pushViewController(destinationVC, animated: true)
        case 2:
            let destinationVC = DictionaryCollectionViewController()
            destinationVC.titleString = "Dictionary \(manager.random)"
            navigationController?.pushViewController(destinationVC, animated: true)
        default:
            break
        }
        
    }
}


