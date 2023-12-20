//
//  SwiftUIView.swift
//  
//
//  Created by Ariel on 19/12/2023.
//

import Models
import SwiftUI

struct ListViewCell: View {
    
    let artwork: Artwork
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                if let imageURL = artwork.imageURL {
                    // TODO: Use NukeUI
                    AsyncImage(url: URL(string: imageURL))  { phase in
                        switch phase {
                        case .empty:
                            Color.purple.opacity(0.1)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .failure(_):
                            Image(systemName: "exclamationmark.icloud")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                        @unknown default:
                            Image(systemName: "exclamationmark.icloud")
                        }
                    }
                }
            }
            .frame(height: 200)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            ListViewCellTitle(title: artwork.artist)
        }
    }
}

#Preview {
    ListViewCell(artwork: Artwork(title: "Painting",
                               artist: "Pablo Picasso",
                               imageURL: "https://www.artic.edu/iiif/2/d349a360-3690-bbc4-5883-22f4cd8bac84/full/843,/0/default.jpg")
    )
}
