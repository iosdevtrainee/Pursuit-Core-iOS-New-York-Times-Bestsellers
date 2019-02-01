//
//  MainView.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainView: UIView {
  public lazy var bestSellersCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    collectionView.register(BookCell.self, forCellWithReuseIdentifier: "BookCell")
    collectionView.backgroundColor = .blue
    return collectionView
  }()
  
  public lazy var bookCategoriesPicker: UIPickerView = {
    let picker = UIPickerView()
    picker.backgroundColor = .red
    return picker
  }()
  
  var books: [BookDetails]?
  
  required override init(frame:CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupView()
  }
  
  convenience init(books:[BookDetails]){
    self.init(frame: UIScreen.main.bounds)
    self.books = books
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView(){
    self.backgroundColor = .white
    setupSubViews()
  }
  
  private func setupSubViews(){
    setupCollectionView()
    setupPickerView()
  }
  
  private func setupCollectionView(){
    addSubview(bestSellersCollection)
    bestSellersCollection.translatesAutoresizingMaskIntoConstraints = false
    bestSellersCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    bestSellersCollection.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    bestSellersCollection.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
  }
  
  private func setupPickerView(){
    addSubview(bookCategoriesPicker)
    bookCategoriesPicker.translatesAutoresizingMaskIntoConstraints = false
    bookCategoriesPicker.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
    bookCategoriesPicker.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    bookCategoriesPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
}


