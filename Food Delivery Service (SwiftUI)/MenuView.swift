//
//  MenuView.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/10/22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isShowingCart = false
    
    @Binding var shoppingCart: [ShoppingCartItem]
    let restaurant: Restaurant
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    AsyncImage(url: URL(string: restaurant.photo.url)) { image in
                        image
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                            .mask {
                                LinearGradient(colors: [.black,.clear], startPoint: .top, endPoint: .bottom)
                            }
                            .overlay(alignment: .bottomLeading) {
                                VStack(alignment: .leading) {
                                    Text(restaurant.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text("Chinese food")
                                        .foregroundColor(.gray)
                                        .fontWeight(.medium)
                                }
                                .padding()
                            }
                    } placeholder: {
                        ProgressView()
                    }
                        
                    LazyVStack {
                        HStack {
                            Text("Menu")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)
                        Divider()
                            .padding(.horizontal)
                        ForEach(restaurant.menu) { item in
                            MenuItemSubview(name: item.name, description: item.menuDescription, price: item.price, inCart: shoppingCart.first(where: { $0.itemID == item.id })?.quantity ?? 0)
                                .onTapGesture {
                                    if let currentQuantityIndex = shoppingCart.firstIndex(where: {$0.itemID == item.id}) {
                                        shoppingCart[currentQuantityIndex].quantity += 1
                                    } else {
                                        let newItem = ShoppingCartItem(
                                            restaurantID: restaurant.id,
                                            itemID: item.id,
                                            name: item.name,
                                            description: item.menuDescription,
                                            price: item.price,
                                            quantity: 1)
                                        shoppingCart.append(newItem)
                                    }
                                }
                            Divider()
                                .padding(.horizontal)
                        }
                    }
                    .scrollDisabled(true)
                }
                .ignoresSafeArea()
                
            }
            VStack {
                Spacer()
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(.infinity)
                            .shadow(radius: 5)
                }
                    Button {
                        isShowingCart = true
                    } label: {
                        Text("Open Cart" + " (" + String(shoppingCart.map({$0.quantity}).reduce(0, +)) + ")")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.neonGreen)
                            .cornerRadius(.infinity)
                            .shadow(radius: 5)
                    }

                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isShowingCart) {
            CartView(cart: $shoppingCart)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        
        MenuView(shoppingCart: .constant([]), restaurant: JSONDummyData.restaurant)
    }
}
