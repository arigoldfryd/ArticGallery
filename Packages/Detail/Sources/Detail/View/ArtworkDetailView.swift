//
//  ArtworkDetailView.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

public struct ArtworkDetailView: View {
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    DetailImage()
                    DetailTitle(title: "The Starry Night", year: "1983")
                    DetailAuthorTitle(title: "Vicent Van Gogh")
                    DetailDescription(description: "Van Gogh's night sky is a field of roiling energy. \nBelow the exploding stars, the village is a placo of quiet order. Connecting earth and sky is the flamelike cypress, a tree traditionally associated with graveyards and mourning. But death was not ominous for van Gogh.")
                    
                    Divider()
                        .padding(.vertical, 16)
                    
                    Text("About the author")
                        .font(.headline)
                    
                    Text("1859 - 1240")
                        .font(.headline)
                        .fontWeight(.thin)
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ArtworkDetailView()
}
