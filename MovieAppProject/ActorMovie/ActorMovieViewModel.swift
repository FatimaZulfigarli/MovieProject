//
//  ActorMovieViewModel.swift
//  MovieAppProject
//
//  Created by Fatya on 20.07.24.
//


import Foundation

class ActorMovieViewModel {
    var items = [Cast]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    let manager = ActorManager()
    
//    func getActorMovies(actorId: Int) {
//        actorMovieManager.getActorMovies(actorId: actorId) { data, errorMessage in
//            if let errorMessage = errorMessage {
//                self.error?(errorMessage)
//            } else if let data = data {
//                self.items = data.cast ?? []
//                self.success?()
//            }
//        }
//    }
    func getActorMovies(actorId: Int) {
            manager.getActorMovies(actorId: actorId) { [weak self] data, errorMessage in
                guard let self = self else { return }
                if let errorMessage = errorMessage {
                    self.error?(errorMessage)
                } else if let data = data {
                    self.items = data.cast ?? []
                    self.success?()
                }
            }
        }
    }
