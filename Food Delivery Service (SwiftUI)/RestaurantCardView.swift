//
//  RestaurantCardView.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/10/22.
//

import SwiftUI

struct RestaurantCardView: View {
    let name: String
    let imageURL: String?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageURL ?? "")) { image in
                image
                .resizable()
                .aspectRatio(1.0, contentMode: .fill)
                .mask {
                    Circle()
                }
            } placeholder: {
                Circle()
                    .fill(.gray)
            }
            Text(name)
                .multilineTextAlignment(.center)
                .frame(height: 50)
            Text("Chinese food, Fast food")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .font(.caption)
            Text("$$")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .fontWeight(.medium)
        .padding()
        .background(.white)
        .cornerRadius(20)
        
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(name: "PF Changs", imageURL: nil)
    }
}
