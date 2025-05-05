//
//  CupcakeOrderModel.swift
//  Animations
//
//  Created by Kevin Boulala on 18/02/2025.
//

import Foundation

@Observable
class CupcakeOrder: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _flavor = "flavor"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    // MARK: All the flavors
    static let flavors = ["Vanilla", "Stawberry", "Chocolate", "Rainbow"]
    
    
    // MARK: Composition order
    var flavor = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    
    // MARK: Address information
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    // MARK: - Computed properties
    
    /// Address validation
    var hasValidAddress: Bool {
        !(name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty)
    }
    
    /// Cost of the order
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(flavor) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
         return cost
    }
}
