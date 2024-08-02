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
    static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOWYzYTYzYTZiZjc1NGI4NGZlZDJmMzcwZGE1NjI3ZSIsIm5iZiI6MTcyMjU5NzU2MC4zMTU3NjMsInN1YiI6IjY2OGVhMTc0YjAzNWU4MTM0ZDllZDg5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gQhOB4ycENkxm8UNttNwtMCHl_FZmS7Smkjs3PVWIcU"]
    
    static func getUrl(with endpoint: String) -> String {
        baseURL + endpoint
    }
    
    static let baseImageUrl = "https://image.tmdb.org/t/p/original"
}

