//
//  DetailArtistInformation.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailArtistInformation: View {
    
    let information: String
    
    var body: some View {
        Text(information)
            .font(.body)
            .fontWeight(.thin)
    }
}

#Preview {
    DetailArtistInformation(information: "Vicent Van Gogh, 1902-1930")
}
