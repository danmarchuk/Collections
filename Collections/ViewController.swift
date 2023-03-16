//
//  ViewController.swift
//  Collections
//
//  Created by Данік on 03/03/2023.
//

import UIKit

class ViewController: UITableViewController {

    let menuItems = ["Array", "Set", "Dictionary"]
       
       let manager = Manager()

    @IBOutlet weak var myTableView: UITableView!
    
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
               let storydoard = UIStoryboard(name: "ArrayStoryboard", bundle: nil)
               let destinationVC = storydoard.instantiateViewController(withIdentifier: "ArrayStoryboard") as! ArrayVC
               destinationVC.titleString = "Array \(manager.random)"
               navigationController?.pushViewController(destinationVC, animated: true)

           case 1:
               let storydoard = UIStoryboard(name: "ArrayStoryboard", bundle: nil)
               let destinationVC = storydoard.instantiateViewController(withIdentifier: "ArrayStoryboard") as! ArrayVC
               destinationVC.titleString = "Array \(manager.random)"
               navigationController?.pushViewController(destinationVC, animated: true)

           case 2:
               let storydoard = UIStoryboard(name: "ArrayStoryboard", bundle: nil)
               let destinationVC = storydoard.instantiateViewController(withIdentifier: "ArrayStoryboard") as! ArrayVC
               destinationVC.titleString = "Array \(manager.random)"
               navigationController?.pushViewController(destinationVC, animated: true)

           default:
               break
           }
           
       }



}

