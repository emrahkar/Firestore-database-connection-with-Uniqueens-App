//
//  Product.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 25.08.2022.
//

import Foundation

struct Product: Identifiable, Hashable {
    
    var id:String
    var name: String
    var price: Double
    var productCode: String
    var availability: String
    var exTaxPrice: String
    var quantity: Int 
    var productType: ProductType
    var imageName: String = ""
    var description: String = ""
    var rating: Int
    var isOnSale: Bool
}


enum ProductType: String, CaseIterable {
    
    case earrings = "Earrings"
    case necklaces = "Necklaces"
    case bracelets = "Bracelets"
    case pins = "Pins"
    case rings = "Rings"
    case anklets = "Anklets"
    case sets = "Sets"
}
