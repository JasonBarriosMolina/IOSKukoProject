//
//  Invoice.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import Foundation

struct InvoiceModel {
    
    var InvoiceNumber: String
    var InvoiceCodeMH: String
    var GrossPrice: Decimal
    var NetPrice: Decimal
    var CreateDate: String
    var Id: Int
    
    init(dictionary: [String: Any]) {
        self.InvoiceNumber = dictionary[APIKeys.Invoice.InvoiceNumber] as? String ?? ""
        self.InvoiceCodeMH = dictionary[APIKeys.Invoice.InvoiceCodeMH] as? String ?? ""
        self.GrossPrice = dictionary[APIKeys.Invoice.GrossPrice] as? Decimal ?? 0
        self.NetPrice = dictionary[APIKeys.Invoice.NetPrice] as? Decimal ?? 0
        self.CreateDate = dictionary[APIKeys.Invoice.CreateDate] as? String ?? ""
        self.Id = dictionary[APIKeys.Invoice.Id] as? Int ?? -1
    }
    
    init(invoicenumber: String, id: Int, invoicecodemh: String, grossprice: Decimal, netprice: Decimal, createdate: String) {
        self.InvoiceNumber = invoicenumber
        self.InvoiceCodeMH = invoicecodemh
        self.GrossPrice = grossprice
        self.NetPrice = netprice
        self.CreateDate = createdate
        self.Id = id
        
    }
}
