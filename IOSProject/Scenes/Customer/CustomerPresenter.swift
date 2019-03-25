//
//  CustomerPresenter.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/20/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CustomerPresentationLogic {
    func presentDataSource(response: Customer.DataSource.Response)
}

class CustomerPresenter: CustomerPresentationLogic {
    weak var viewController: CustomerDisplayLogic?
    
    // MARK: presenter logic
    func presentDataSource(response: Customer.DataSource.Response) {
        if let error = response.error {
            print("HAY UN ERROR: \(error)")
            return
        }
        if let customers = response.items {
            let displayedCustomers = customers.map({Customer.DataSource.ViewModel.DisplayedItem.init(businessname: $0.BusinessName, name: $0.Name, dni: $0.Dni, id: $0.Id)})
            viewController?.displayDataSource(viewModel: Customer.DataSource.ViewModel.init(displayedItems: displayedCustomers))
        }
    }
}