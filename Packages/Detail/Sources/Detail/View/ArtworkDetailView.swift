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
                VStack(alignment: .leading, spacing: 10) {

                    DetailImage(url: viewModel.artwork.imageURL)
                    
                    DetailTitle(title: viewModel.artwork.title, year: "1983")

                    DetailAuthorTitle(title: viewModel.artwork.artist.title)
                    
                    if let description = viewModel.artwork.artist.description {
                        DetailDescription(description: description)
                    }
                    
                    Divider()
                        .padding(.vertical, 16)
                    
                    Text("About the author")
                        .font(.headline)
                    
                    Text("1859 - 1240")
                        .font(.headline)
                        .fontWeight(.thin)
                    
                    Spacer()
                }
                .task(viewModel.fetchArtistDetails)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ArtworkDetailView(viewModel: DetailViewModel(artwork: Artwork(id: 0, title: "", artist: Artist(id: 0, title: ""), imageURL: nil)))
}
