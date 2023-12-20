//
//  DetailTitle.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailTitle: View {
    
    let title: String
    let year: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .padding(.top)
            
            Text("(\(year)")
                .font(.subheadline)
                .fontWeight(.light)
                .padding(.top)
        }
    }
}

#Preview {
    DetailTitle(title: "The Starry Night", year: "1983")
}
