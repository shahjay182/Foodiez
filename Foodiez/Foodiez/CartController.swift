//
//  CartController.swift
//  Foodiez
//
//  Created by Tilakbhai Suthar on 2019-12-06.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import Foundation
import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var itemsAc = [String]()
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLablePrint: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsAc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = cartTableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: simpleTableIdentifier)
        }
        cell?.textLabel?.text = itemsAc[indexPath.row]
        updateTotal()
        return cell!
        
    }
    func updateTotal(){
        var TotalValue = 0.00
        for item in itemsAc {
          
            let str = item
            let strArr = str.split(separator: " ")
            
            for item in strArr {
                
                
                let part = item.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                
                if let intVal = Double(part) {
                    TotalValue = TotalValue + Double((intVal/100))
                    print(TotalValue)
                }
            }
        }
        totalLablePrint.text = String(format: "$%0.2f", TotalValue)
        print(TotalValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(itemsAc)
    }
}
