//
//  DetailTitle.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailTitle: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .padding(.top)
        }
    }
}

#Preview {
    DetailTitle(title: "The Starry Night")
}
