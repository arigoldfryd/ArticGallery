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
            ListViewCellImage(imageURL: artwork.imageURL)
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
