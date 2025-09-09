import Foundation
import Combine

class NetworkService {
    static let shared = NetworkService()
    private let baseURL = "https://rick-morty-ios-app-production.up.railway.app/api"
    
    private init() {}
    
    func fetchCharacters(page: Int = 1, name: String = "") -> AnyPublisher<CharacterResponse, Error> {
        var urlString = "\(baseURL)/characters?page=\(page)"
        if !name.isEmpty {
            urlString += "&name=\(name)"
        }
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchCharacterById(id: Int) -> AnyPublisher<Character, Error> {
        guard let url = URL(string: "\(baseURL)/characters/\(id)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Character.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchEpisodes(page: Int = 1) -> AnyPublisher<EpisodeResponse, Error> {
        guard let url = URL(string: "\(baseURL)/episodes?page=\(page)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: EpisodeResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchLocations(page: Int = 1) -> AnyPublisher<LocationResponse, Error> {
        guard let url = URL(string: "\(baseURL)/locations?page=\(page)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: LocationResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
