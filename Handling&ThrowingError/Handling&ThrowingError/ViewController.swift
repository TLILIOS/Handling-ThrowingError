//
//  ViewController.swift
//  Handling&ThrowingError
//
//  Created by HTLILI on 30/05/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtuserName: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtmobile: UITextField!
    
    @IBOutlet weak var txtpassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        do {
            try signUp()
        } catch {
            print("Error: \(error)")
        }
        
    }
    func signUp() throws {
        let userName = txtuserName.text!
        let email = txtemail.text!
        let mobile = txtmobile.text!
        let passWord = txtpassWord.text!
        if !userName.isValidUserName {
            throw SignUpError.invalidUserName
        }
        if !email.isValidEmail {
            throw SignUpError.invalidEmail
        }
        if !mobile.isValidMobile {
            throw SignUpError.invalidMobile
        }
        if !passWord.isValidPassWord {
            throw SignUpError.invalidPassWord
        }
        print("Pass Throught")
    }
}

extension String {
    var isValidUserName: Bool {
        return self.count > 3
    }
    
    var isValidEmail: Bool {
        let format = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[_A-Za-z0-9-\\+]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
    // mobile regular expression france swift
    var isValidMobile: Bool {
        let format = "^(00336|00337|07|06\\+33|06|07|6|7)(0-9)([0-9]{8})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
    var isValidPassWord: Bool {
        return self.count > 5
    }
}
enum SignUpError: Error {
    case invalidUserName
    case invalidEmail
    case invalidMobile
    case invalidPassWord
}

