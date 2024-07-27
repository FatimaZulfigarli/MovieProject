//
//  MovieListUseCase.swift
//  MovieAppProject
//
//  Created by Fatya on 24.07.24.
//

import Foundation
protocol MovieListUseCase {
    func getMovies(endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void))
}

