//
//  DetailImage.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailImage: View {
    var body: some View {
        VStack {
            Text("")
        }
        .frame(height: 250)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 12, x: 2, y: 2)
    }
}

#Preview {
    DetailImage()
}
