//
//  CustomDetailInteractor.swift
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

protocol CustomDetailBusinessLogic
{
  func requestUIInformation(request: CustomDetail.UIInformation.Request)
}

protocol CustomDetailDataStore
{
  var customer: CustomerModel? { get set }
}

class CustomDetailInteractor: CustomDetailBusinessLogic, CustomDetailDataStore
{
    
    var presenter: CustomDetailPresentationLogic?
    var worker: CustomDetailWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    var customer: CustomerModel?
    
    func requestUIInformation(request: CustomDetail.UIInformation.Request) {
        if let customer = customer {
            presenter?.presentUIInformation(response: CustomDetail.UIInformation.Response.init(item: customer))
        }
    }
}
