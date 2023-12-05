import Foundation

struct searchResults: Decodable, Identifiable {
    var id: Int
    var collectiblename: String
    var collectibleversion: String
    var alt: String
    var stagename: String
    var groupname: String
}
