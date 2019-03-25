//
//  AlamoFireHelper.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import Foundation
import Alamofire

class AlamoFireHelper {
    
    static let timeOut = 30.0
    
    class func createRequest(parameters: Parameters?, requestPath: String, httpMethod: HTTPMethod) -> URLRequest? {
        guard let requestURL = URL(string: requestPath) else {
            return nil
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = AlamoFireHelper.timeOut
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        return request
    }
    
}
