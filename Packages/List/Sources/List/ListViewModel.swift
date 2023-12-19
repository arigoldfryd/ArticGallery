//
//  ListViewModel.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

struct ListPaginationResponse: Codable {
    let total: Int?
    let limit: Int?
    let offset: Int?
    let total_pages: Int?
    let current_page: Int?
    let nextUrl: String?
}

struct ListThumbnailResponse: Codable, Hashable {
    let lqip: String
}

struct ListDataResponse: Codable, Hashable {
    let id: Int
    let title: String
    let artistTitle: String?
    let imageId: String?
}

struct ListResponse: Codable {
    let pagination: ListPaginationResponse
    let data: [ListDataResponse]
}

@MainActor
@Observable
class ListViewModel {
    private(set) var dataSource: [ListDataResponse] = []
    
    func getData() {
        Task {
            do {
                let urlRequest = URLRequest(url: URL(string: "https://api.artic.edu/api/v1/artworks")!)
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(ListResponse.self, from: data)
                dataSource.append(contentsOf: response.data)
            } catch {
                print(error)
            }
        }
    }
}

#if DEBUG
//let testData: [ListDataResponse] = [
//    ListDataResponse(id: 1, title: "Still Life with Fruit", artistTitle: "Émile Bernard"),
//    ListDataResponse(id: 2, title: "Scholar's Rock or Brushrest", artistTitle: "China"),
//    ListDataResponse(id: 3, title: "Jean-Baptiste-Siméon Chardin", artistTitle: "Georgia O'Keeffe (American, 1887–1986)"),
//    ListDataResponse(id: 4, title: "Red Hills with Flowers", artistTitle: "Cupisnique"),
//    ListDataResponse(id: 5, title: "Head of a Young Woman", artistTitle: "Chavín-Cupisnique"),
//    ListDataResponse(id: 6, title: "Portrait of a Man", artistTitle: "North coast, Peru"),
//    ListDataResponse(id: 7, title: "Still Life with Apples", artistTitle: "Émile Bernard"),
//    ListDataResponse(id: 8, title: "Still Life with Fruit and Game", artistTitle: "China"),
//    ListDataResponse(id: 9, title: "Portrait of a Lady", artistTitle: "Georgia O'Keeffe (American, 1887–1986)"),
//    ListDataResponse(id: 10, title: "Portrait of a Man", artistTitle: "Cupisnique"),
//]
#endif
