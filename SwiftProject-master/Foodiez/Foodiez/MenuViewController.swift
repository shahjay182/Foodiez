//
//  MenuViewController.swift
//  Foodiez
//
//  Created by Jay Shah on 2019-12-02.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import UIKit
import CoreData


class MenuViewController: UIViewController {
    
    var container: NSPersistentContainer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        guard container != nil else
        {
            fatalError("This view needs a persistent container.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "menutologin") {
            if let nextVC = segue.destination as? SignUpViewController {
                nextVC.container = container
            }
        }
        
    }
}
