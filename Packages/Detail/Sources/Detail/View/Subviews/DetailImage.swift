//
//  DetailImage.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import NukeUI
import SwiftUI

struct DetailImage: View {
    
    let url: String?
    
    var body: some View {
        VStack {
            if let url {
                LazyImage(url: URL(string: url)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFit()
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
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 400)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 12, x: -5, y: 5)
    }
}

#Preview {
    DetailImage(url: "")
}
