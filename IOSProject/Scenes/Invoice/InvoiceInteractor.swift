//
//  InvoiceInteractor.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol InvoiceBusinessLogic {
    func requestDataSource(username: String)
}

protocol InvoiceDataStore {
    var username: String? { get set }
    var name: String? { get set }
    
    func getItemSelected(indexPath: IndexPath) -> InvoiceModel
}

class InvoiceInteractor: InvoiceBusinessLogic, InvoiceDataStore {
    var name: String?
    var username: String?
    var invoices = [InvoiceModel]()
    
    var presenter: InvoicePresentationLogic?
    var invoiceWorker = KukoWorker(store: KukoAPI())
    
    func requestDataSource(username: String) {
        invoiceWorker.fetchInvoices(username: username) { (invoices, error) in
            let response = Invoice.DataSource.Response.init(items: invoices, error: error)
            self.presenter?.presentDataSource(response: response)
        }
    }

    func getItemSelected(indexPath: IndexPath) -> InvoiceModel {
        return invoices[indexPath.row]
    }
}