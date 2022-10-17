//
//  ReadJSONData.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Trevor Bugden on 2022-10-13.
//

import Foundation

class ReadData: ObservableObject  {
    @Published var restaurants = [Restaurant]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "RestaurantData", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
            
            self.restaurants = decodedData.data.restaurants
            print(decodedData.data.restaurants.count)
        } catch {
            print(error)
        }
    }
}
