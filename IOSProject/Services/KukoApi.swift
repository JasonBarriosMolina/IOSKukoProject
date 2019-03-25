//
//  KukoApi.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import Foundation
import Alamofire

class KukoAPI: KukoStoreProtocol {
    func fetchInvoices(username: String, completionHandler: @escaping ([InvoiceModel]?, ServiceError?) -> Void) {
        guard let isNetworkReachable = NetworkReachabilityManager()?.isReachable else {
            completionHandler(nil, ServiceError.unknown)
            return
        }
        if !isNetworkReachable {
            completionHandler(nil, ServiceError.internet)
        }
        else {
            makeFetchInvoicesAPICall(username: username, completionHandler: completionHandler)
        }
    }
    
    
    private func makeFetchInvoicesAPICall(username: String, completionHandler: @escaping ([InvoiceModel]?, ServiceError?) -> Void) {
        let requestPath = EndPoints.getInvoices(username: username)
        if let request = AlamoFireHelper.createRequest(parameters: nil, requestPath: requestPath, httpMethod: .get) {
            Alamofire.request(request).responseJSON { (response) in
                if let jsonData = response.result.value as? [String: Any],
                    let invoices = jsonData[APIKeys.Main.InvoiceList] as? [[String: Any]] {
                    completionHandler(invoices.map({InvoiceModel.init(dictionary: $0)}), nil)
                }
                else {
                    completionHandler(nil, ServiceError.wrongAnswer)
                }
            }
        } else {
            completionHandler(nil, ServiceError.badURL)
        }
    }
    
    func fetchCustomers(username: String, completionHandler: @escaping ([CustomerModel]?, ServiceError?) -> Void) {
        guard let isNetworkReachable = NetworkReachabilityManager()?.isReachable else {
            completionHandler(nil, ServiceError.unknown)
            return
        }
        if !isNetworkReachable {
            completionHandler(nil, ServiceError.internet)
        }
        else {
            makeFetchCustomersAPICall(username: username, completionHandler: completionHandler)
        }
    }
    
    
    private func makeFetchCustomersAPICall(username: String, completionHandler: @escaping ([CustomerModel]?, ServiceError?) -> Void) {
        let requestPath = EndPoints.getCustomers(username: username)
        if let request = AlamoFireHelper.createRequest(parameters: nil, requestPath: requestPath, httpMethod: .get) {
            Alamofire.request(request).responseJSON { (response) in
                if let jsonData = response.result.value as? [String: Any],
                    let customers = jsonData[APIKeys.Main.CustomerList] as? [[String: Any]] {
                    completionHandler(customers.map({CustomerModel.init(dictionary: $0)}), nil)
                }
                else {
                    completionHandler(nil, ServiceError.wrongAnswer)
                }
            }
        } else {
            completionHandler(nil, ServiceError.badURL)
        }
    }
    
    func fetchUser(username: String, password: String, completionHandler: @escaping ([UserModel]?, ServiceError?) -> Void) {
        guard let isNetworkReachable = NetworkReachabilityManager()?.isReachable else {
            completionHandler(nil, ServiceError.unknown)
            return
        }
        if !isNetworkReachable {
            completionHandler(nil, ServiceError.internet)
        }
        else {
            makeFetchUserAPICall(username: username, password: password, completionHandler: completionHandler)
        }
    }
    
    
    private func makeFetchUserAPICall(username: String, password: String, completionHandler: @escaping ([UserModel]?, ServiceError?) -> Void) {
        let requestPath = EndPoints.getUser(username: username, password: password)
        if let request = AlamoFireHelper.createRequest(parameters: nil, requestPath: requestPath, httpMethod: .get) {
            Alamofire.request(request).responseJSON { (response) in
                if let jsonData = response.result.value as? [String: Any],
                    let user = jsonData[APIKeys.Main.PersonList] as? [[String: Any]] {
                    completionHandler(user.map({UserModel.init(dictionary: $0)}), nil)
                }
                else {
                    completionHandler(nil, ServiceError.wrongAnswer)
                }
            }
        } else {
            completionHandler(nil, ServiceError.badURL)
        }
    }
}
