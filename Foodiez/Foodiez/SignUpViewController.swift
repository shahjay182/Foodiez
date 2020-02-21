//
//  SignUpViewController.swift
//  Foodiez
//
//  Created by Jay Shah on 2019-12-02.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var UserErrorLabel: UILabel!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var UserNumberTextField: UITextField!
    @IBOutlet weak var SubmitButtonClick: UIButton!
    
    @IBAction func SubmitButtonSave(_ sender: Any) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        //Now let’s create an entity and new user records.
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserMaster")
        var flag = true
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let userName = data.value(forKey: "username") as! String
                
                if(userName == UserNameTextField.text){
                    print(userName)
                    flag = false
                    break
                }
            }
            if(flag == false){
                 UserErrorLabel.text = "User Is Already Register"
            } else {
                let userEntity = NSEntityDescription.entity(forEntityName: "UserMaster", in: managedContext)!
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(UserNameTextField.text, forKeyPath: "username")
                user.setValue(PasswordTextField.text, forKey: "password")
                user.setValue(UserNumberTextField.text, forKey: "usernumber")
                
                //Now we have set all the values. The next step is to save them inside the Core Data
                
                do {
                    try managedContext.save()
                    
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
                performSegue(withIdentifier: "LoginPageControl" , sender: self)
            }
        } catch {
            
            print("Failed")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
