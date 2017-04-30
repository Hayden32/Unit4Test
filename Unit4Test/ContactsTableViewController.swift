//
//  ContactsTableViewController.swift
//  Unit4Test
//
//  Created by Hayden Hastings on 4/30/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts: [Contacts] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ContactsController.fetchContactsFromCloudKit { (contacts) in
            self.contacts = contacts
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.textLabel?.text = contact.email

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toContactDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let contactDetailVC = segue.destination as? ContactsInfoViewController else { return }
            let contacts = ContactsController.shared.contact[indexPath.row]
            contactDetailVC.contacts = contacts
        }
    }
}
