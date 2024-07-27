//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation

// MARK: - Welcome
//struct ActorMovie: Codable {
//
//    let cast: [MovieResult]?
//    let id: Int?
//}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let actorMovie = try? JSONDecoder().decode(ActorMovie.self, from: jsonData)

import Foundation

// MARK: - ActorMovie
struct ActorMovie: Codable, TopImageBottomLabelProtocol {
    let cast: [Cast]?
    let id: Int?

    var imageName: String {
        return cast?.first?.posterPath ?? ""
    }

    var labelText: String {
        return cast?.first?.title ?? ""
    }
}

// MARK: - Cast
struct Cast: Codable, TopImageBottomLabelProtocol {
    let adult: Bool?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order
        case backdropPath = "backdrop_path"
    }

    var imageName: String {
        return posterPath ?? ""
    }

    var labelText: String {
        return title ?? ""
    }
}
