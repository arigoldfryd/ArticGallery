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
    
    private let artistRepository: ArtistRepository
    
    public init(artwork: Artwork, artistRepository: ArtistRepository = DefaultArtistRepository()) {
        self.artwork = artwork
        self.artistRepository = artistRepository
    }
    
    func fetchArtistDetails() async {
        do {
            let response = try await artistRepository.getArtist(id: artwork.artist.id)
            
            artwork.artist = Artist(id: response.id ?? 0,
                                    title: response.title ?? "Unknown",
                                    birthDate: response.birthDate, 
                                    deathDate: response.deathDate,
                                    description: response.description)
        } catch {
            print(error)
        }
    }
}
