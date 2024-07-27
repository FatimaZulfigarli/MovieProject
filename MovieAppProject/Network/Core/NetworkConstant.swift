//
//  NetworkConstant.swift
//  MovieAppProject
//
//  Created by Fatya on 12.07.24.
//

import Foundation
import Alamofire
class NetworkConstants {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjI1MzQxNmZhYzBjZDI0NzYyOTFlYjMzYzkyYmViNyIsInN1YiI6IjYyNDNmMjAyYzUwYWQyMDA1Y2RlOTVmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0dUMhxX4qBZrY_NXSEf9cWjAnzB-Xl1Qu5rj9CzET7k"]
    
    static func getUrl(with endpoint: String) -> String {
        baseURL + endpoint
    }
    
    static let baseImageUrl = "https://image.tmdb.org/t/p/original"
}
