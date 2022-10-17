//
//  MenuItem.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/11/22.
//

import SwiftUI

struct MenuItemSubview: View {
    let name: String
    let description: String
    let price: Double
    var inCart: Int
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .foregroundColor(.black)
                    if inCart > 0 {
                        Text(String(inCart) + " in cart")
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                            .padding(.horizontal, 5)
                            .background(Color.neonGreen)
                            .cornerRadius(5)
                            .foregroundColor(.black)
                    }
                }
                Text(description)
                    .font(.caption)
            }
            Spacer()
            Text("$" + price.description)
                .padding(.leading)
        }
        .foregroundColor(.gray)
        .padding(.horizontal)
    }
}

struct MenuItemSubview_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemSubview(name: "Ceasar Salad", description: "Ceaser dressing w/ chicken, romaine lettuce, and croutons.", price: 5.99, inCart: 10)
    }
}
