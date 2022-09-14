//
//  ViewController.swift
//  Ingenious Med Coding Challenge
//
//  Created by Patrick Ramirez on 9/14/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createUserButtonTapped(_ sender: UIButton) {

        guard let userName = usernameTextField.text, !userName.isEmpty else {
            showAlert(message: "Please enter valid username")
            return
        }

        guard isValidEmail(userName) else {
            showAlert(message: "Username should be a valid email format (should contain '@' symbol & should end with '.com'  domain)")
            return
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter valid password")
            return
        }

        guard isValidPassword(password: password) else {
            showAlert(message: "Please enter password with numbers, special characters and uppercase letter")
            return
        }

        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showAlert(message: "Please enter valid confirm password")
            return
        }

        guard isValidPassword(password: confirmPassword) else {
            showAlert(message: "Please enter confirm password with numbers, special characters and uppercase letter")
            return
        }

        guard password == confirmPassword else {
            showAlert(message: "Please validate passwords match")
            return
        }

        // Create User
        showAlert(title: "Success", message: "User created for \(userName)")
    }

    // MARK: Alerts
    func showAlert(title: String = "Error", message: String) {

        // Create new Alert
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in

         })

        //Add OK button to a dialog message
        dialogMessage.addAction(ok)

        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }

    // MARK: Validation

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPassword(password: String) -> Bool {
        // Password should contain at-least 1 Uppercase character
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let capitalLetterTextTest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard capitalLetterTextTest.evaluate(with: password) else { return false }

        // Password should contain at-least 2 numbers
        let numberRegEx  = ".*[0-9]+.*"
        let numberLetterTest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard numberLetterTest.evaluate(with: password) else { return false }

        // Password should contain at-least 1 Special Character
        let specialCharacterRegEx  = ".*[!&^%$#@()/_*+-]+.*"
        let specialCharacterText = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        guard specialCharacterText.evaluate(with: password) else { return false }

        // Password should be at-least 6 characters long (min - 6 characters, max - no limit)
        guard password.count >= 6 else { return false }

        return true
    }
}

