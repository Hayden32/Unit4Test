//
//  Contacts.swift
//  Unit4Test
//
//  Created by Hayden Hastings on 4/30/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation
import CloudKit

class Contacts {
    
    private let nameKey = "name"
    private let emailKey = "email"
    private let phoneNumberKey = "phoneNumber"
    
    let name: String
    let email: String
    let phoneNumber: String
    
    init(name: String, email: String, phoneNumber: String) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    init?(cloudKitRecord: CKRecord) {
        guard let name = cloudKitRecord[nameKey] as? String,
        let email = cloudKitRecord[emailKey] as? String,
        let phoneNumber = cloudKitRecord[phoneNumberKey] as? String
            else { return nil }
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: "Unit4Test")
        record.setValue(name, forKey: nameKey)
        record.setValue(email, forKey: emailKey)
        record.setValue(phoneNumber, forKey: phoneNumberKey)
        return record
    }
}
