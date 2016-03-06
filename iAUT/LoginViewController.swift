//
//  LoginViewController.swift
//  iAUT
//
//  Created by Ádibádi on 05/03/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var english = true
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var saveUserNameLabel: UILabel!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBAction func loginButtonTouchUpInside(sender: AnyObject) {
        
        if !english {
            saveUserNameLabel.text = "Save username:"
        } else {
            saveUserNameLabel.text = "Benutzername speichern:"
        }
        
        english = !english
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                
                if (self.passwordTextField.frame.origin.y + self.passwordTextField.frame.size.height) > (self.view.frame.size.height - keyboardSize.height) {
                    self.view.layoutIfNeeded()
                    UIView.animateWithDuration(0.5, animations: {
                      self.imageViewTopConstraint.constant = -((self.passwordTextField.frame.origin.y + self.passwordTextField.frame.size.height) - (self.view.frame.size.height - keyboardSize.height))
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            self.imageViewTopConstraint.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func editingDidEndOnExit(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
