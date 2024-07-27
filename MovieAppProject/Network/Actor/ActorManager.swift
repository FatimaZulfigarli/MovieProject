//
//  ActorManager.swift
//  MovieAppProject
//
//  Created by Fatya on 19.07.24.
//

import Foundation
class ActorManager: ActorUseCase {
    func getActors(page: Int, completion: @escaping((Actor?, String?) -> Void)) {
        let endpoint = ActorEndpoint.popularActors.path + "?page=\(page)"
        NetworkManager.request(model: Actor.self, endpoint: endpoint, completion: completion)
    }
    
    func getActorMovies(actorId: Int, completion: @escaping ((ActorMovie?, String?) -> Void)) {
        NetworkManager.request(model: ActorMovie.self,
                               endpoint: ActorEndpoint.movieListOfActor(id: actorId).path,
                               completion: completion)
    }
}
