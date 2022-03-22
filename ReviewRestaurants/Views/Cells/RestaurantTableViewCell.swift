//
//  RestaurantTableViewCell.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 15.03.22.
//

import Foundation
import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    
    // MARK: Variables
    
    var restaurant: Restaurant? {
        didSet {
            self.setData()
        }
    }
    
    // MARK: Initializers
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.customInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customInit()
    }
    
    
    // MARK: Basic Methods
    
    func customInit() {
//        self.restaurantNameLabel.backgroundColor = .blue
    }
    
    
    // MARK: Setters
    
    func setData() {
        self.mainImageView.image = restaurant?.image
        self.restaurantNameLabel.text = restaurant?.name
    }
    
}
