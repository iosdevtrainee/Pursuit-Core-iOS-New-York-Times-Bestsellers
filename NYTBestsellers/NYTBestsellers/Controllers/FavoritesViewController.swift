//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by J on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
  private var sessionManager: SessionManager?
  private var persistenceManager: FavoritesManager?
  private var favorites: [FavoriteBook]?
  private lazy var mainView: FavoritesView = {
    let favsView = FavoritesView()
    return favsView
  }()
  
  override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        favorites = getFavorites()
    }
  
  convenience init(sessionManager:
    SessionManager,
       persistenceManager: FavoritesManager) {
    self.init()
    self.sessionManager = sessionManager
    self.persistenceManager = persistenceManager
    
  }
  
  private func setupView() {
    self.view = mainView
    mainView.favoritesCollection.delegate = self
    mainView.favoritesCollection.dataSource = self
  }
  
  private func getFavorites() -> [FavoriteBook] {
    let favorites = persistenceManager?.getFavorites()
    switch  {
    case :
      <#code#>
    default:
      <#code#>
    }
  }

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height / 2.5)
  }
}

extension FavoritesViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = mainView.favoritesCollection.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell else { return UICollectionViewCell() }
    cell.textLabel.text = "Stuff"
    return cell
  }
}


