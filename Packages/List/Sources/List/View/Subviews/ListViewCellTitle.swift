//
//  ListViewCellTitle.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import SwiftUI

struct ListViewCellTitle: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .lineLimit(1)
    }
}

#Preview {
    ListViewCellTitle(title: "Picasso")
}
