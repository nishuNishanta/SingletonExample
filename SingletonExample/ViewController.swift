//
//  ViewController.swift
//  SingletonExample
//
//  Created by nishu nishanta on 08/05/19.
//  Copyright © 2019 nishu nishanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userIdTextFiled: UITextField!
    @IBOutlet weak var passwordVisibleSwitch: UISwitch!
    
    @IBOutlet weak var logInButton: UIButton!
    
    
    var timer:Timer?
    var timeLeft = 60
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userIdTextFiled.delegate = self
        passwordTextField.delegate = self
        
        //if passwordTextField.text!.isEmpty{
         //   self.logInButton.isUserInteractionEnabled = false
       // }
        self.logInButton.isEnabled = false
        if UserPreferences.shared.isPasswordVisible() {
            passwordVisibleSwitch.isOn = true
            passwordTextField.isSecureTextEntry = false
        }
        else {
            passwordVisibleSwitch.isOn = false
            passwordTextField.isSecureTextEntry = true
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        userIdTextFiled.text = ""
        passwordTextField.text = ""
        userIdTextFiled.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.userIdTextFiled.center.x += self.view.bounds.width
            // self.passwordTextField.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [.transitionCurlUp],
                       animations: {
                        self.passwordTextField.center.x += self.view.bounds.width
        },
                       completion: nil
        )
         
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
  
    @IBAction func passwordVisibleSwitched(_ sender: Any) {
        
        let pwdSwitch:UISwitch = sender as! UISwitch
        
        if pwdSwitch.isOn {
            passwordTextField.isSecureTextEntry = false
            UserPreferences.shared.setPasswordVisibity(true)
        }
        else {
            passwordTextField.isSecureTextEntry = true
            UserPreferences.shared.setPasswordVisibity(false)
        }
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     
        let nextTag = textField.tag + 1
       
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
         } else {
            textField.resignFirstResponder()
        }

        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if passwordTextField.text!.isEmpty || userIdTextFiled.text!.isEmpty{
            logInButton.isEnabled = false
        }
        else{
            logInButton.isEnabled = true
        }
    }
 
    @IBAction func logInButtonAction(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
}

