//
//  DetailPlaceOfOrigin.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailPlaceOfOrigin: View {
    let placeOfOrigin: String
    
    var body: some View {
        Text(placeOfOrigin)
            .font(.body)
            .fontWeight(.medium)
    }
}

#Preview {
    DetailPlaceOfOrigin(placeOfOrigin: "Germany")
}
