//
//  MovieManager.swift
//  MovieAppProject
//
//  Created by Fatya on 19.07.24.
//

import Foundation
class MovieManager {
    func getMovies(endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void))  {
        NetworkManager.request(model: Movie.self, endpoint: endpoint.rawValue, completion: completion)
        
    }
}
