//
//  DetailMediumDisplay.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI

struct DetailMediumDisplay: View {
    let mediumDisplay: String
    
    var body: some View {
        Text(mediumDisplay)
            .font(.subheadline)
    }
}

#Preview {
    DetailMediumDisplay(mediumDisplay: "Painted on oil")
}
