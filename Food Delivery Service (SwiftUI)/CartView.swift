//
//  CartView.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/13/22.
//

import SwiftUI

struct CartView: View {
    @Environment (\.dismiss) var dismiss
    
    @Binding var cart: [ShoppingCartItem]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.horizontal)
                Text("Your Order")
                ScrollView {
                    if cart.isEmpty {
                        Text("Cart is empty")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    } else {
                        LazyVStack{
                            
                            ForEach(Array(cart.enumerated()), id: \.element) { (i, item) in
                                Divider()
                                    .padding(.horizontal)
                                CartItem(name: item.name, price: String(item.price), quantity: item.quantity, changeQuantityAction: { quantity in
                                    if quantity == 0 {
                                        cart.remove(at: i)
                                    } else {
                                        cart[i].quantity = quantity
                                    }
                                })
                                    .padding(.vertical, 10)
                            }
                        }
                    }
                }
                VStack {
                    Divider()
                    Text("Total: $" + String(format: "%.2f", cart.map({$0.price * Double($0.quantity)}).reduce(0, +)))
                        .fontWeight(.semibold)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 70)
            }
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("Place Order")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.neonGreen)
                        .cornerRadius(.infinity)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
                }

            }
        }
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: .constant([]))
    }
}
