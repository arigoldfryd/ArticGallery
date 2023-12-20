//
//  DetailAuthorTitle.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailAuthorTitle: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.body)
            .fontWeight(.thin)
    }
}

#Preview {
    DetailAuthorTitle(title: "Vicent Van Gogh")
}
