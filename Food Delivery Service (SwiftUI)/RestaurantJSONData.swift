//
//  RestaurantJSONData.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Trevor Bugden on 2022-10-13.
//

import Foundation

struct Welcome: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable, Identifiable {
    let address, id, name: String
    let offer: String?
    let photo: PhotoJSON
    let menu: [MenuJSON]
}

// MARK: - Menu
struct MenuJSON: Codable, Identifiable {
    let id, name, menuDescription: String
    let price: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case menuDescription = "description"
        case price
    }
}

// MARK: - Photo
struct PhotoJSON: Codable {
    let url: String
}

//MARK: -

struct JSONDummyData {
    static let restaurant = Restaurant(address: "Restaurant Name", id: "348905g43", name: "Restaurant", offer: nil, photo: PhotoJSON(url: "dsaf"), menu: [MenuJSON(id: "", name: "", menuDescription: "", price: 8.99)])
}
