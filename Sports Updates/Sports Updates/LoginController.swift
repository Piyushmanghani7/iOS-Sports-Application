//
//  LoginController.swift
//  Sports Updates
//
//  Created by Piyush Manghani on 2/4/23.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class LoginController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var logemail: UITextField!
    
    @IBOutlet weak var logpass: UITextField!
    
    let userdefault = UserDefaults.standard
    
    public static var username : String?
    public static var email : String?
    public static var uid : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logemail.delegate = self
        logpass.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    @IBAction func login(_ sender: UIButton) {
        
        guard let email = logemail.text else {return}
        guard let password = logpass.text else {return}
        Auth.auth().signIn(withEmail: email, password: password){
            (user, error) in
            if(error == nil)
            {
                guard let uid = Auth.auth().currentUser?.uid else {return}
                guard let username = Auth.auth().currentUser?.displayName else {return}
                print("user login succesfully")
                LoginController.uid = uid
                LoginController.email = email
                LoginController.username = username
                
                //userdefault
                self.userdefault.setValue(true, forKey: "Userlogin")
                
                self.userdefault.set(LoginController.username, forKey: "username")
                self.userdefault.set(LoginController.email, forKey: "useremail")
                
                self.userdefault.synchronize()

                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController =  self.storyboard?.instantiateViewController(withIdentifier: "tabbarcontroller")
                                
                if #available(iOS 13.0, *) {
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController!)
                } else {
                    // Fallback on earlier versions
                }
                                    
                
            }
           
            else
            {
                print("error", error?.localizedDescription)
                let alert = UIAlertController(title: "Alert", message:error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
        
    }
    

}
