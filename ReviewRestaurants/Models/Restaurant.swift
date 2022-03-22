//
//  Restaurant.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 15.03.22.
//

import Foundation
import UIKit

final class Restaurant: NSObject {
    
    var image: UIImage
    
    var name: String
    
    public init(image: UIImage = UIImage(named: "back-button-icon") ?? UIImage(), name: String) {
        self.image = image
        self.name = name
        
        super.init()
    }
    
}
