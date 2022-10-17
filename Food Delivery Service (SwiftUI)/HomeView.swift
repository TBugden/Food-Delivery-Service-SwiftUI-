//
//  ContentView.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/10/22.
//

import SwiftUI

struct ShoppingCartItem: Hashable {
    let restaurantID: String
    let itemID: String
    let name: String
    let description: String
    let price: Double
    var quantity: Int
}

struct HomeView: View {
    @ObservedObject var data = ReadData()

    @State var searchText = ""
    @FocusState var searchBarFocused: Bool
    
    @State private var isShowingCart = false
    @State private var isShowingMenu = false
    
    let viewLayout = Array(repeating: GridItem(.flexible(), spacing: 25), count: 2)
    
    @State var selectedRestaurant: Restaurant?
    @State var shoppingCart: [ShoppingCartItem] = []
    @State var cartRestaurantID: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Text("FoodDelivery~")
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                    Button {
                        isShowingCart = true
                    } label: {
                        HStack {
                            Image(systemName: "cart")
                            Text(shoppingCart.map({ $0.quantity }).reduce(0, +).description)
                        }
                        .fontWeight(.bold)
                        .padding(10)
                        .background(Color.neonGreen)
                        .foregroundColor(.softBlack)
                        .cornerRadius(10)
                    }

                }
                .padding(.top)
                ZStack(alignment:.leading) {
                    
                    TextField("Search for a restaurant", text: $searchText)
                        .padding(10)
                        .focused($searchBarFocused)
                        .font(.body)
                        .background(Color.softBlack)
                        .cornerRadius(10)
                    if searchText.isEmpty {
                        Text("Search for a restaurant")
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                searchBarFocused = true
                            }
                    }
                }
                .padding(.bottom)
                
            }
            .padding(.horizontal)
            .background(.black)
            .foregroundColor(.white)
            
            ScrollView {
                LazyVGrid(columns: viewLayout, spacing: 25) {
                    ForEach(data.restaurants) { restaurant in
                        RestaurantCardView(name: restaurant.name, imageURL: restaurant.photo.url)
                            .fullScreenCover(item: $selectedRestaurant) { restaurant in
                                MenuView(shoppingCart: $shoppingCart, restaurant: restaurant)
                            }
                            .onTapGesture {
                                selectedRestaurant = restaurant
                        }
                        
                    }
                }
                .padding(25)
            }
            
        }
        .background(.gray.opacity(0.1))
        .sheet(isPresented: $isShowingCart) {
            CartView(cart: $shoppingCart)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
