//
//  ContactsInfoViewController.swift
//  Unit4Test
//
//  Created by Hayden Hastings on 4/30/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class ContactsInfoViewController: UIViewController {
    
    var contacts: Contacts?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        
        guard let name = nameTextField.text,
        let email = emailTextField.text,
        let phoneNumber = phoneNumberTextField.text,
        !name.isEmpty
            else { addNameAlert(); return }
        ContactsController.sendContactsToCloudKit(name: name, email: email, phoneNumber: phoneNumber)
        DispatchQueue.main.async {
            self.viewDidLoad()
        }
    }
    
    func addNameAlert() {
        let alertController = UIAlertController(title: "WARNING!", message: "Please fill out name section.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
