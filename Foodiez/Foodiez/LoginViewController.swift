//
//  LoginViewController.swift
//  Foodiez
//
//  Created by Tilakbhai Suthar on 2019-12-02.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var loginUsernameTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginSubmitButton: UIButton!
    @IBOutlet weak var UserErrorLabel: UILabel!
    
    @IBAction func loginSubmitClick(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserMaster")
        
        //        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
        //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
        //
        
        //        // Data Truncate
        //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        //
        //        // Configure Fetch Request
        //        fetchRequest.includesPropertyValues = false
        //        fetchRequest.predicate = NSPredicate(format: "username = %@","")
        //
        //        do
        //        {
        //            let test = try managedContext.fetch(fetchRequest)
        //
        //            let objectToDelete = test[0] as! NSManagedObject
        //            managedContext.delete(objectToDelete)
        //
        //            do{
        //                try managedContext.save()
        //            }
        //            catch
        //            {
        //                print(error)
        //            }
        //
        //        }
        //        catch
        //        {
        //            print(error)
        //        }
        var flag = false
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let userName = data.value(forKey: "username") as! String
                let userPassword = data.value(forKey: "password") as! String
                
                if(userName == loginUsernameTextField.text && userPassword == loginPasswordTextField.text){
                    print(userName)
                    flag = true
                    break
                }
            }
            if(flag == false){
                UserErrorLabel.text = "User is not Register / Check Password "
            } else {
                UserErrorLabel.text = ""
                performSegue(withIdentifier: "MainPageControl" , sender: self)
            }
            
        } catch {
            
            print("Failed")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
