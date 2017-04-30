//
//  ContactsController.swift
//  Unit4Test
//
//  Created by Hayden Hastings on 4/30/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation
import CloudKit

class ContactsController {
    
    var contact: [Contacts] = []
    static let shared = ContactsController()
    
    static let publicDataBase = CKContainer.default().publicCloudDatabase
    
    static func sendContactsToCloudKit(name: String, email: String, phoneNumber: String) {
        let contacts = Contacts(name: name, email: email, phoneNumber: phoneNumber)
        let contactRecord = contacts.cloudKitRecord
        publicDataBase.save(contactRecord) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    static func fetchContactsFromCloudKit(completion: @escaping ([Contacts]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Unit4Test", predicate: predicate)
        publicDataBase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else { return }
            let contacts = records.flatMap({ Contacts(cloudKitRecord: $0 )})
            completion(contacts)
        }
    }
}
