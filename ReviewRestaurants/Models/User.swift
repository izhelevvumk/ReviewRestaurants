//
//  User.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 22.03.22.
//

import Foundation
import UIKit

final class User: NSObject {
    
    var name: String
    var email: String
    var password: String
    
    public init(name: String, email: String, password: String) {
        self.email = email
        self.name = name
        self.password = password
        
        super.init()
    }
    
}
