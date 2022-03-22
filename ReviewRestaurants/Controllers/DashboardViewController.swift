//
//  DashboardViewController.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 22.02.22.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var restaurantsTableView: UITableView!
    
    
    // MARK: Actions
    
    
    // MARK: Constants
    
    let kDefaultRowHeight = 100.0
    let kOurCell = "restaurantsCell"
    
    // MARK: Variables
    
    private var restaurants: [Restaurant] = []
    
    var mainLabelText: String?
    
    weak var myDelegate: DashboardViewControllerDelegate?
    
    
    // MARK: Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
        
        restaurants.append(Restaurant(name: "First"))
        restaurants.append(Restaurant(image: UIImage(), name: "Second"))
        restaurants.append(Restaurant(name: "Third"))
        restaurants.append(Restaurant(name: "Go back to the previous screen"))
        
        restaurantsTableView.reloadData()
    }
    
}

extension DashboardViewController: UITableViewDelegate {
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kOurCell, for: indexPath)
        
        if let restaurantCell = cell as? RestaurantTableViewCell {
            restaurantCell.restaurant = restaurants[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == restaurants.count - 1 {
            return 60.0
        }
        
        return kDefaultRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == restaurants.count - 1 {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

protocol DashboardViewControllerDelegate: AnyObject {
    func returnString(_ string: String)
}
