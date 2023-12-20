//
//  ListViewCellImage.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import NukeUI
import Models
import SwiftUI

@MainActor
struct ListViewCellImage: View {
    
    let imageURL: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image
        }
        .frame(height: 200)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
    
    @ViewBuilder
    private var image: some View {
        if let imageURL {
            LazyImage(url: URL(string: imageURL)) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else if state.error != nil {
                    Color.gray
                } else {
                    ProgressView()
                }
            }
        } else {
            Color.gray
        }
    }
}

#Preview {
    ListViewCellImage(imageURL: Artwork.placeholder().imageURL)
}
