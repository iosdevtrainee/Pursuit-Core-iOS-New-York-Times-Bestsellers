//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  private var persistenceManager: FavoritesManager!
  private var book: BookDetails!
  private var detailView: DetailView = {
    let detailView = DetailView()
    return detailView
  }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
    }
  convenience init(persistenceManager: FavoritesManager,
                   book: BookDetails) {
    self.init()
    self.persistenceManager = persistenceManager
    self.book = book
    self.delegate = self
    setupUI(book: book)
  }
  
  private func setupUI(book:BookDetails){
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(saveFavorite))
    detailView.authorLabel.text = book.author
//    detailView.image.image
    detailView.textView.text = book.description
  }
}

  
  
}

extension DetailViewController {
  @objc private func saveFavorite(){
    persistenceManager.saveFavorites(favorite: book)
  }
}

