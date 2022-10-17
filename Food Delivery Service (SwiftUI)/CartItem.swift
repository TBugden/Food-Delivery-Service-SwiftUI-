//
//  CartItem.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/13/22.
//

import SwiftUI

struct CartItem: View {
    let name: String
    let price: String
    
    @State var quantity: Int
    @FocusState var focused
    
    let changeQuantityAction: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                
            } label: {
                TextField("", value: $quantity, formatter: NumberFormatter())
                    .padding(7.5)
                    .frame(width: 35)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(7.5)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .keyboardType(.numberPad)
                    .focused($focused)
            }

            VStack(alignment: .leading) {
                Text(name)
                Text("Chicken broth with noodles, chicken pieces, and noodles.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
            }
            Spacer()
            Text("$" + price)
        }
        .padding(.horizontal)
        .onChange(of: focused) { isFocused in
            if isFocused == false {
                changeQuantityAction(quantity)
            }
        }
    }
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItem(name: "Chicken Soup", price: "5.99", quantity: 1, changeQuantityAction: {_ in })
    }
}
