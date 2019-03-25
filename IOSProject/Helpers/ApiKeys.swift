//
//  ApiKeys.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//
import Foundation

enum APIKeys {
    struct Invoice {
        static let InvoiceNumber = "InvoiceNumber"
        static let InvoiceCodeMH = "InvoiceCodeMH"
        static let GrossPrice = "GrossPrice"
        static let NetPrice = "NetPrice"
        static let CreateDate = "CreateDate"
        static let Id = "Id"
    }
    
    struct Customer {
        static let BusinessName = "BusinessName"
        static let Dni = "Dni"
        static let Name = "Name"
        static let Id = "Id"
    }
    
    struct User {
        static let Dni = "Dni"
        static let Name = "Name"
        static let Id = "Id"
    }
    
    struct Main {
        static let InvoiceList = "InvoiceList"
        static let CustomerList = "CustomerList"
        static let PersonList = "PersonList"
    }
}
