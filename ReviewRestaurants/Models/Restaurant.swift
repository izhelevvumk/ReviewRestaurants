//
//  Restaurant.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 15.03.22.
//

import Foundation
import UIKit
import FMDB

class Restaurant: NSObject {
    
    var image: UIImage
    
    var name: String
    
    public init(image: UIImage = UIImage(named: "back-button-icon") ?? UIImage(), name: String) {
        self.image = image
        self.name = name
        
        super.init()
    }
    
    public init(set: FMResultSet) {
        self.name = String(set.string(forColumn: "restaurant_name") ?? "")
        self.image = UIImage()
        super.init()
    }
}

extension Restaurant {
    static var selectRestaurants: String {
        return """
        SELECT * FROM restaurants
        """
    }
    
    static func getRestaurantsFromDbSet(_ set: FMResultSet?) -> [Restaurant] {
        guard let set = set else {
            return []
        }
        
        var rests: [Restaurant] = []
        
        while (set.next()) {
            rests.append(Restaurant(set: set))
        }
        
        return rests
    }
}
