//
//  ListViewCellDescription.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import SwiftUI

struct ListViewCellDescription: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.light)
            .lineLimit(1)
    }
}

#Preview {
    ListViewCellDescription(text: "Picasso")
}
