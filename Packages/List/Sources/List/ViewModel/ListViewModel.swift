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
    
    enum State {
        case loading
        case loaded
        case error(String)
    }
    
    private(set) var artworks: [Artwork]
    private(set) var error: String?
    private(set) var state: State = .loaded
    
    private var page = 0
    private var totalPages = Int.max
    
    private let artworksRepository: ArtworksRepository
    
    init(artworks: [Artwork] = [], artworksRepository: ArtworksRepository = DefaultRepository()) {
        self.artworks = artworks
        self.artworksRepository = artworksRepository
    }
    
    @Sendable func fetchArtworks() async {
        if page == totalPages {
            return
        }
        
        if page == 0 {
            state = .loading
        }
        
        page += 1
        
        do {
            let response = try await artworksRepository.getArtworks(page: page)
            
            totalPages = response.pagination.totalPages
            
            artworks.append(contentsOf: response.data.map { res in
                let url = "https://www.artic.edu/iiif/2/\(res.imageId ?? "")/full/843,/0/default.jpg"
                return Artwork(id: res.id,
                               title: res.title,
                               artistId: res.artistId,
                               artistDisplay: res.artistDisplay,
                               imageURL: url,
                               placeOfOrigin: res.placeOfOrigin ?? "Unknown Place",
                               mediumDisplay: res.mediumDisplay)
            })
            
            error = nil
            state = .loaded
        } catch {
            showError(error)
        }
    }
    
    private func showError(_ error: Error) {
        guard artworks.isEmpty else { return }
        state = .error(error.localizedDescription)
        self.error = error.localizedDescription
    }
}
