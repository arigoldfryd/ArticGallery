//
//  ListView.swift
//  ArticGallery
//
//  Created by Ariel on 19/12/2023.
//

import Detail
import SwiftUI

@MainActor
public struct ListView: View {
    
    @State var viewModel: ListViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible()),
    ]
    
    public init() {
        self.viewModel = ListViewModel()
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.artworks, id: \.id) { artwork in
                        NavigationLink(destination: {
                            ArtworkDetailView()
                        }, label: {
                            ListViewCell(artwork: artwork)
                        })
                        .foregroundColor(.black)
                        .task {
                            if viewModel.artworks.last == artwork {
                                await viewModel.fetchArtworks()
                            }
                        }
                    }
                }
                .padding()
            }
            .task {
                await viewModel.fetchArtworks()
            }
            .navigationTitle("Institute of Art")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListView()
}