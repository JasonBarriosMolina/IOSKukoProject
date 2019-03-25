//
//  InvoiceDetailRouter.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/23/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol InvoiceDetailRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol InvoiceDetailDataPassing
{
  var dataStore: InvoiceDetailDataStore? { get set}
}

class InvoiceDetailRouter: NSObject, InvoiceDetailRoutingLogic, InvoiceDetailDataPassing
{
  weak var viewController: InvoiceDetailViewController?
  var dataStore: InvoiceDetailDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: InvoiceDetailViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: InvoiceDetailDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}