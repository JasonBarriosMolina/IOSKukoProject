//
//  KukoWorker.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import UIKit

class KukoWorker{
    
    var store: KukoStoreProtocol
    
    init(store: KukoStoreProtocol) {
        self.store = store
    }
    
    func fetchInvoices(username: String, completionHandler:@escaping([InvoiceModel]?, ServiceError?) -> Void) {
        store.fetchInvoices(username: username, completionHandler: completionHandler)
    }
    
    func fetchCustomers(username: String, completionHandler:@escaping([CustomerModel]?, ServiceError?) -> Void) {
        store.fetchCustomers(username: username, completionHandler: completionHandler)
    }
    
    func fetchUser(username: String, password: String, completionHandler:@escaping([UserModel]?, ServiceError?) -> Void) {
        store.fetchUser(username: username, password: password, completionHandler: completionHandler)
    }
    
}


protocol KukoStoreProtocol{
    func fetchInvoices(username: String, completionHandler:@escaping([InvoiceModel]?, ServiceError?) -> Void)
    
    func fetchCustomers(username: String, completionHandler:@escaping([CustomerModel]?, ServiceError?) -> Void)
    
    func fetchUser(username: String, password: String, completionHandler:@escaping([UserModel]?, ServiceError?) -> Void)
}
