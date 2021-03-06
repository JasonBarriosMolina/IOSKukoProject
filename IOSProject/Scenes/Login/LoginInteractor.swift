//
//  LoginInteractor.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/21/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic {
    func requestDataSource(request: User.DataSource.Request)
}

protocol LoginDataStore {
    var username: String? { get set }
    var name: String? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var username: String?
    var name: String?
    
    var presenter: LoginPresentationLogic?
    var loginWorker = KukoWorker(store: KukoAPI())
    
    func requestDataSource(request: User.DataSource.Request) {
        loginWorker.fetchUser(username: request.username, password: request.password) { (user, error) in
            let response = User.DataSource.Response.init(items: user, error: error)
            self.presenter?.checkUser(response: response)
        }
    }
    
}
