//
//  ActorUseCase.swift
//  MovieAppProject
//
//  Created by Fatya on 26.07.24.
//

import Foundation

protocol ActorUseCase {
    func getActorMovies(actorId: Int, completion: @escaping((ActorMovie?, String?) -> Void))
}
