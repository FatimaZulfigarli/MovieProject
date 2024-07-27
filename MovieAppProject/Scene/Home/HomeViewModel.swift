import Foundation
struct HomeModel {
    let title: String
    let movies: [MovieResult]
}

class HomeViewModel {
    
    var items = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    let movieManager = MovieManager()
    
    func getMovies(){
        getMovieDatas(title: "Popular", endpoint: .popularMovie)
        getMovieDatas(title: "Now Playing", endpoint: .nowPlayingMovie)
        getMovieDatas(title: "Top Rated", endpoint: .topRatedMovie)
        
    }
    
   private func getMovieDatas(title: String, endpoint: MovieEndpoint) {
       movieManager.getMovies(endpoint: endpoint) { data, errorMessage in
           if let errorMessage {
               self.error?(errorMessage)
           } else if let data {
               self.items.append(.init(title: title, movies: data.results ?? []))
               self.success?()
           }
       }

   }
}
       
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.items.append(.init(title: title, movies: data.results ?? []))
//                self.success?()
//            }
//        }
//
//    }

