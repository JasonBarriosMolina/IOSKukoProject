//
//  CustomerModel.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/20/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import Foundation

struct CustomerModel {
    
    var BusinessName: String
    var Dni: String
    var Name: String
    var Id: Int
    
    init(dictionary: [String: Any]) {
        self.BusinessName = dictionary[APIKeys.Invoice.InvoiceNumber] as? String ?? ""
        self.Dni = dictionary[APIKeys.Invoice.InvoiceCodeMH] as? String ?? ""
        self.Name = dictionary[APIKeys.Invoice.GrossPrice] as? String ?? ""
        self.Id = dictionary[APIKeys.Invoice.Id] as? Int ?? -1
    }
    
    init(businessname: String, id: Int, dni: String, name: String) {
        self.BusinessName = businessname
        self.Dni = dni
        self.Name = name
        self.Id = id
        
    }
}
