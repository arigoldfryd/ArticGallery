//
//  ArtworkDetailView.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import SwiftUI
import Models

public struct ArtworkDetailView: View {
    
    @State var viewModel: DetailViewModel
    
    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    DetailImage(url: viewModel.artwork.imageURL)
                    
                    DetailTitle(title: viewModel.artwork.title)

                    DetailPlaceOfOrigin(placeOfOrigin: viewModel.artwork.placeOfOrigin)
                    
                    DetailArtistInformation(
                        information: viewModel.artwork.artistDisplay ?? viewModel.artist.title
                    )
                    
                    if let mediumDisplay = viewModel.artwork.mediumDisplay {
                        DetailMediumDisplay(mediumDisplay: mediumDisplay)
                    }
                    
                    Divider()
                        .padding(.vertical, 16)
                    
                    if let description = viewModel.artist.description {
                        DetailDescription(description: description)
                    }
                    
                    Spacer()
                }
                .task(viewModel.fetchArtistDetails)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ArtworkDetailView(viewModel: DetailViewModel(artwork: Artwork.placeholder()))
}
