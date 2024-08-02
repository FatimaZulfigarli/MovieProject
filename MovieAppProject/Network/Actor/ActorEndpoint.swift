//
//  ActorEndpoint.swift
//  MovieAppProject
//
//  Created by Fatya on 19.07.24.
//

import Foundation

//enum ActorEndpoint: String {
//    case popularActors = "person/popular"
//    case actorsFilmPersonPart = "/person/"
//    case actorsFilmLastPart = "/movie_credits"

enum ActorEndpoint {
    case popularActors
    case movieListOfActor (id: Int)
    
    var path: String {
        switch self {
        case .popularActors:
            return "person/popular"
        case .movieListOfActor(let id):
            return "person/\(id)/movie_credits"
            
        }
    }
}
