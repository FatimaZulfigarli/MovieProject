//
//  ActorController.swift
//  MovieAppProject
//
//  Created by Fatya on 15.07.24.
//

import UIKit

class ActorController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    let viewModel = ActorViewModel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
            configureViewModel()
        }
        
        func configureUI() {
            title = "Actor List"
            collection.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        }
        
        func configureViewModel() {
            viewModel.getActorList()
            viewModel.error = { errorMessage in
                print("Error: \(errorMessage)")
            }
            viewModel.success = {
                self.collection.reloadData()
            }
        }
    }

    extension ActorController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            let item = viewModel.items[indexPath.item]
            cell.configure(data: viewModel.items[indexPath.item])
            cell.backgroundColor = .red
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2 - 10, height: 288)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let actorMovieController = storyboard.instantiateViewController(withIdentifier: "ActorMovieController") as? ActorMovieController {
                actorMovieController.actorId = viewModel.items[indexPath.item].id!
                self.navigationController?.pushViewController(actorMovieController, animated: true)
            }
        }
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            viewModel.pagination(index: indexPath.item)
        }
    }
