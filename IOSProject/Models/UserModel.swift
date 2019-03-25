//
//  UserModel.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/22/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import Foundation

struct UserModel {
    
    var Name: String
    var Dni: String
    var Id: Int
    
    init(dictionary: [String: Any]) {
        self.Dni = dictionary[APIKeys.User.Dni] as? String ?? ""
        self.Name = dictionary[APIKeys.User.Name] as? String ?? ""
        self.Id = dictionary[APIKeys.User.Id] as? Int ?? -1
    }
    
    init(id: Int, dni: String, name: String) {
        self.Dni = dni
        self.Name = name
        self.Id = id
        
    }
}
