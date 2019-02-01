//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by J on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
  public lazy var favoritesCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let favsCV = UICollectionView(frame: self.frame, collectionViewLayout: layout)
    favsCV.backgroundColor = .white
    favsCV.register(BookCell.self, forCellWithReuseIdentifier: "BookCell")
    return favsCV
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    
  }
  
  private func setupView(){
    self.backgroundColor = .white
    constrainFavCollection()
  }
  
  private func constrainFavCollection(){
    self.addSubview(favoritesCollection)
    favoritesCollection.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: favoritesCollection, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: favoritesCollection, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: favoritesCollection, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: favoritesCollection, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
  }
  
}

