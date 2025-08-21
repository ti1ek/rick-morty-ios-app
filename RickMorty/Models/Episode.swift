import Foundation

struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

struct EpisodeResponse: Codable {
    let info: PageInfo
    let results: [Episode]
}
