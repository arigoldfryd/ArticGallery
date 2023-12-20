//
//  ListViewModel.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation
import Network
import Models

@MainActor
@Observable
class ListViewModel {
    
    private(set) var artworks: [Artwork]
    private var page = 1
    
    private let artworksRepository: ArtworksRepository
    
    init(artworks: [Artwork] = [], artworksRepository: ArtworksRepository = DefaultArtworksRepository()) {
        self.artworks = artworks
        self.artworksRepository = artworksRepository
    }
    
    func getArtworks() {
        Task {
            do {
                // TODO: Add page management
                
                let response = try await artworksRepository.getArtworks(page: 1)
                artworks.append(contentsOf: response.data.map { res in
                    let url = "https://www.artic.edu/iiif/2/\(res.imageId ?? "")/full/843,/0/default.jpg"
                    return Artwork(title: res.title, artist: res.artistTitle ?? "Unknown", imageURL: url)
                })
            } catch {
                print(error)
            }
        }
    }
}
