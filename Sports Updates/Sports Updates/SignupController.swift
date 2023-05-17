//
//  SignupController.swift
//  Sports Updates
//
//  Created by Piyush Manghani on 2/4/23.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase
class SignupController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var phoneno: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let userdefault = UserDefaults.standard
    
    
    public static var userName : String?
    public static var userEmail : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstname.delegate = self
        phoneno.delegate = self
        email.delegate = self
        password.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signupButton(_ sender: Any) {
        guard let firstname = firstname.text else {return}
        guard let phoneno = phoneno.text else {return}
        guard let email = email.text else {return}
        guard let password = password.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password)
        { user, err in
            
            DispatchQueue.main.async {
                if  err == nil && user != nil
                {
                    let changerequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changerequest?.displayName = firstname
                    changerequest?.commitChanges(completion: { error in
                        guard let uid = Auth.auth().currentUser?.uid else {return}
                        print("user login")
                        
                        
                        SignupController.userName = firstname
                        SignupController.userEmail = email
                        //userdefault
                        self.userdefault.setValue(true, forKey: "Userlogin")
                        self.userdefault.synchronize()
                        
                        // calling save information method
                        self.saveuserinfo(firstname: firstname, phoneno: phoneno, email: email, password: password, uid: uid )
                        
                        let alert = UIAlertController(title: "Congratulations", message:"You are succesfully registered with Splitbills", preferredStyle: UIAlertController.Style.alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                            
                            self.dismiss(animated: true)
                            self.navigationController?.popViewController(animated: true)
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                        //self.performSegue(withIdentifier: "login", sender: self)
                        
                    })
                }
                else
                {
                    print("ewfhw", err)
                    let alert = UIAlertController(title: "Alert", message:"E mail should be in @format & Password should be atleat 6 character long", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
            
            
        }
        
    }
    func saveuserinfo(firstname: String, phoneno: String, email: String, password: String, uid: String)
    {
        
        let ref = Database.database().reference().child("Registered Users").child("User Info").child(firstname)
        
        print("user info saved")
        
        let ref2 = Database.database().reference().child("AppUsers").child(firstname)
        let object2 = [
            "firstname": firstname,
            "phoneno": phoneno,
            "email": email,
            "password": password,
            "uid": uid
            
        ] as [String: Any]
        ref2.setValue(object2)
        
    }
    
}
