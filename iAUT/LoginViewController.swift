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
    @IBOutlet weak var saveUserNameLabel: UILabel!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
