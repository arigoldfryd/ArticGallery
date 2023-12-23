//
//  ListView.swift
//  ArticGallery
//
//  Created by Ariel on 19/12/2023.
//

import Detail
import Models
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
            VStack {
                switch viewModel.state {
                case .loading:
                    loadingView
                case .loaded, .loadingNextPage:
                    grid
                case .error(let error):
                    emptyView(error)
                }
            }
            .task(viewModel.fetchArtworks)
            .navigationTitle("Institute of Art")
        }
    }
    
    var grid: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.artworks, id: \.id) { artwork in
                    NavigationLink(value: artwork) {
                        ListViewCell(artwork: artwork)
                    }
                    .foregroundColor(.black)
                    .task {
                        if viewModel.artworks.last == artwork {
                            await viewModel.fetchArtworks()
                        }
                    }
                }
            }
            .padding()
            
            if viewModel.state == .loadingNextPage {
                ProgressView()
            }
        }
        .refreshable(action: viewModel.fetchArtworks)
        .navigationDestination(for: Artwork.self) { artwork in
            ArtworkDetailView(viewModel: DetailViewModel(artwork: artwork))
        }
        
    }
    
    var loadingView: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
                .padding()
            
            Text("Loading...")
                .foregroundColor(.gray)
                .italic()
        }
    }
    
    @ViewBuilder
    func emptyView(_ error: String) -> some View {
        VStack(alignment: .center) {
            Spacer()
            
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            Text("Oops! Something went wrong.")
                .font(.headline)
                .foregroundColor(.black)
                .bold()
            
            Text(error)
                .font(.footnote)
                .foregroundColor(.gray)
                .italic()
            
            Button(action: {
                Task {
                    await viewModel.fetchArtworks()
                }
            }) {
                Text("Try Again")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ListView()
}
