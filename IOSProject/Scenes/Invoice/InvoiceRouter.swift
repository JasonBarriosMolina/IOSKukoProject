//
//  InvoiceRouter.swift
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

@objc protocol InvoiceRoutingLogic
{
  func goToNextView(indexPath: IndexPath)
}

protocol InvoiceDataPassing
{
  var dataStore: InvoiceDataStore? { get set }
}

class InvoiceRouter: NSObject, InvoiceRoutingLogic, InvoiceDataPassing
{
  weak var viewController: InvoiceViewController?
  var dataStore: InvoiceDataStore?
  
  // MARK: Routing
    func goToNextView(indexPath: IndexPath) {
        if let invoice = dataStore?.getItemSelected(indexPath: indexPath)
        {
            if let detailViewController = R.storyboard.login().instantiateInitialViewController() as? InvoiceDetailViewController {

                detailViewController.router?.dataStore?.invoice = invoice
                viewController?.navigationController?.pushViewController(detailViewController, animated: true)

            }
        }
    }
  
}


