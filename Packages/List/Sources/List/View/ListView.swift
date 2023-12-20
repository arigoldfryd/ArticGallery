//
//  ListView.swift
//  ArticGallery
//
//  Created by Ariel on 19/12/2023.
//

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
                    ForEach(viewModel.artworks, id: \.self) { artwork in
                        ListViewCell(artwork: artwork)
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
        }
    }
}

#Preview {
    ListView()
}
