//
//  DetailViewModel.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import Foundation
import Network
import Models

@MainActor
@Observable
public class DetailViewModel {
    
    private(set) var artwork: Artwork
    private(set) var artist: Artist
    
    private let artistRepository: ArtistRepository
    
    public init(artwork: Artwork, artistRepository: ArtistRepository = DefaultArtistRepository()) {
        self.artwork = artwork
        self.artistRepository = artistRepository
        self.artist = Artist()
    }
    
    func fetchArtistDetails() async {
        guard let id = artwork.artistId else { return }
        
        do {
            let response = try await artistRepository.getArtist(id: id)
            let data = response.data
            
            artist = Artist(id: data.id ?? 0,
                            title: data.title ?? "Unknown",
                            description: data.description)
        } catch {
            print(error)
        }
    }
}
