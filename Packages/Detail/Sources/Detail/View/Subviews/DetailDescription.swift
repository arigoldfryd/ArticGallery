//
//  DetailDescription.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailDescription: View {
    
    let description: String
    
    var body: some View {
        Text(description)
            .fontWeight(.light)
            .padding(.top)
    }
}

#Preview {
    DetailDescription(description: "Van Gogh's night sky is a field of roiling energy. \nBelow the exploding stars, the village is a placo of quiet order. Connecting earth and sky is the flamelike cypress, a tree traditionally associated with graveyards and mourning. But death was not ominous for van Gogh.")
}
