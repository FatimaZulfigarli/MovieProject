//
//  ActorViewModel.swift
//  MovieAppProject
//
//  Created by Fatya on 15.07.24.
//

import Foundation
class ActorViewModel {
    var items = [ActorData]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    var actorData: Actor?
    let manager = ActorManager()
    
    func getActorList() {
        manager.getActors(page: (actorData?.page ?? 0) + 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.actorData = data
                self.items.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index:Int) {
        let currentPage = actorData?.page ?? 1
        let totalPages = actorData?.totalPages ?? 0
        if index == items.count - 2 && currentPage <= totalPages {
            getActorList()
        }
    }
//    {
//        actorManager.getActors() { data, errorMessage in
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.items = data.results ?? []
//                self.success?()
//            }
//        }
//    }
}

//        NetworkManager.request(model: Actor.self, endpoint: Endpoint.popularActors.rawValue) { data, errorMessage in
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.items = data.results ?? []
//                self.success?()
//            }
//        }
//    }
//}
