import Foundation

struct LocationModel: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

struct LocationResponse: Codable {
    let info: PageInfo
    let results: [LocationModel]
}
