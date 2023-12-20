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
            ListViewCellDescription(text: artwork.placeOfOrigin)
        }
    }
}

#Preview {
    ListViewCell(artwork: Artwork.placeholder())
}
