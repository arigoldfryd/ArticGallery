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
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    public init() {
        self.viewModel = ListViewModel()
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.dataSource, id: \.self) { item in
                        ListCell(item: item)
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                viewModel.getData()
            }
            .navigationTitle("Institute of Art")
        }
    }
}

struct ListCell: View {
    
    let item: ListDataResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                if let id = item.imageId {
                    let imageURL = URL(string: "https://www.artic.edu/iiif/2/\(id)/full/843,/0/default.jpg")!
                    AsyncImage(url: imageURL)  { phase in
                        switch phase {
                        case .empty:
                            Color.purple.opacity(0.1)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        case .failure(_):
                            Image(systemName: "exclamationmark.icloud")
                                .resizable()
                                .scaledToFit()
                        @unknown default:
                            Image(systemName: "exclamationmark.icloud")
                        }
                    }
                }
            }
            .frame(height: 200)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(item.artistTitle ?? "Unknown")
                .font(.headline)
                .lineLimit(1)
        }
    }
}

#Preview {
    ListView()
}
