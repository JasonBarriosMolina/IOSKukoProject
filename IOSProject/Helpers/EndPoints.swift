//
//  ENdPoints.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = "http://40.117.76.131/Kuko/Kuko.Service.IOS/ConfigurationService.svc/"
}

struct EndPoints {
    static func getInvoices(username: String) -> String {
        return "\(API.baseURL)GetInvoicesByUser?username=\(username)"
    }
    static func getCustomers(username: String) -> String {
        return "\(API.baseURL)GetCustomers?username=\(username)"
    }
    static func getUser(username: String, password: String) -> String {
        return "\(API.baseURL)GetPersonByCredentials?username=\(username)&password=\(password)"
    }
}
