//
//  SignInViewController.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 7/27/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    lazy var signInService = StubSignInService();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.leftViewMode = UITextFieldViewMode.Always;
        usernameTextField.leftView = UIImageView(image: UIImage(named: "username_icon"));
        
        passwordTextField.leftViewMode = UITextFieldViewMode.Always;
        passwordTextField.leftView = UIImageView(image: UIImage(named: "pw_icon"));
        
        signInButton.addTarget(self, action: "signInTapped", forControlEvents: UIControlEvents.TouchUpInside)
        registerButton.addTarget(self, action: "registerTapped", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func signInTapped() {
        signInService.login(
            email: usernameTextField.text,
            password: passwordTextField.text,
            success: {(let user) in
                User.setCurrentUser(user);
                
                var myGroup = Group(creator: nil);
                myGroup.name = "Kroger";
                Group.setCurrentGroup(myGroup);
                
                self.performSegueWithIdentifier("SignInToHackathonsSegue", sender: self);
            },
            failure: {(let error) in
                UIAlertView(
                    title: "Login failed",
                    message: error.localizedDescription,
                    delegate: nil,
                    cancelButtonTitle: "OK")
                    .show();
            });
    }
    
    func registerTapped() {
        UIAlertView(
            title: "Coming soon!",
            message: "This functionality isn't yet implemented. Check back soon!",
            delegate: nil,
            cancelButtonTitle: "OK")
            .show();
    }
    
//    private func themeButton(button: UIButton) {
//        button.layer.cornerRadius = 5.0
//        button.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.75);
//        button.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
//        for controlState in [UIControlState.Normal, UIControlState.Highlighted, UIControlState.Selected] {
//            button.setTitleColor(UIColor.darkTextColor(), forState: controlState)
//        }
//    }
}
