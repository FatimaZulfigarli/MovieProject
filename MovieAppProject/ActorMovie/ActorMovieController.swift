//
//  ActorMovieController.swift
//  MovieAppProject
//
//  Created by Fatya on 19.07.24.
//

import UIKit

class ActorMovieController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    var actorId: Int!
      private let viewModel = ActorMovieViewModel()
         
      override func viewDidLoad() {
          super.viewDidLoad()
          setupCollectionView()
          configureViewModel()
          viewModel.getActorMovies(actorId: actorId)
      }
         
      private func setupCollectionView() {
          collection.dataSource = self
          collection.delegate = self
          collection.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
      }
         
      private func configureViewModel() {
          viewModel.error = { errorMessage in
              print("Error: \(errorMessage)")
          }
          viewModel.success = {
              self.collection.reloadData()
          }
      }
  }

  extension ActorMovieController: UICollectionViewDataSource {
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return viewModel.items.count
      }
         
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
          let item = viewModel.items[indexPath.item]
          cell.configure(data: item)
          cell.backgroundColor = .red
          return cell
      }
  }

  extension ActorMovieController: UICollectionViewDelegate {
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          collectionView.deselectItem(at: indexPath, animated: false)
      }
  }

  extension ActorMovieController: UICollectionViewDelegateFlowLayout {
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: collectionView.frame.width/2 - 10, height: 288)
      }
  }
