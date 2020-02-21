//
//  MainPageController.swift
//  Foodiez
//
//  Created by Tilakbhai Suthar on 2019-12-02.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import Foundation
import UIKit

class MainPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemsAc = [String]()
    
    @IBOutlet weak var mainPageLabel: UILabel!
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    private let items = [ "Chicken Tandoori                                 $10.99" , "Chicken masala                                   $12.99" , "Chikken Tikka                                       $14.99", "Panner Butter Masala                           $9.89",
                          "Panner Tikka Masala                            $12.99", "Panner Pasanda                                   $7.99", "Paneer Bhurji                                        $14.79",
                          "Veg Kholapuri                                     $16.49", "Veg Kadai                                          $12.49", "Veg Tawa                                            $17.99", "Cauliflower Masala                              $19.99", "Bhindi                                                  $5.99",
                          "Butter Naan                                         $2.99"]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = mainTableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: simpleTableIdentifier)
        }
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = items[indexPath.row]
        let message = "You have ordered \(rowValue)"
        let controller = UIAlertController(title: "Item ordered", message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Yes I did", style: .default, handler:{ action in
            //run your function here
            self.actionClick(rowValue: rowValue)
            
        })
        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(action)
        controller.addAction(action2)
        present(controller , animated: true , completion: nil)
    }
    func actionClick(rowValue: String) {
        itemsAc.append(rowValue)
        print(itemsAc)
    }
    
    @IBAction func OnclickCart(_ sender: Any) {
        performSegue(withIdentifier: "CartControl" , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.destination is CartController
        {
            let vc = segue.destination as? CartController
            vc?.itemsAc = itemsAc
        }
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
