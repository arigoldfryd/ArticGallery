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
@Observable class ListViewModel {
    
    private(set) var artworks: [Artwork]
    private(set) var error: String?
    
    private var page = 0
    private var totalPages = Int.max
    
    private let artworksRepository: ArtworksRepository
    
    init(artworks: [Artwork] = [], artworksRepository: ArtworksRepository = DefaultArtworksRepository()) {
        self.artworks = artworks
        self.artworksRepository = artworksRepository
    }
    
    @Sendable func fetchArtworks() async {
        if page == totalPages {
            return
        }
        
        page += 1
        
        do {
            let response = try await artworksRepository.getArtworks(page: page)
            
            totalPages = response.pagination.totalPages
            
            artworks.append(contentsOf: response.data.compactMap { res in
                guard let imageId = res.imageId, !imageId.isEmpty else {
                    return nil
                }

                let url = "https://www.artic.edu/iiif/2/\(imageId)/full/843,/0/default.jpg"
                return Artwork(id: res.id,
                               title: res.title,
                               artistId: res.artistId,
                               artistDisplay: res.artistDisplay,
                               imageURL: url,
                               placeOfOrigin: res.placeOfOrigin ?? "Unknown Place",
                               mediumDisplay: res.mediumDisplay)
            })
            
            error = nil
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    @Sendable func refreshArtworks() async {
        page = 0
        artworks.removeAll()
        await fetchArtworks()
    }
}
