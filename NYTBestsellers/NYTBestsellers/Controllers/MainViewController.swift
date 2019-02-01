//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by J on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
class MainViewController: UIViewController {
  private var sessionManager: SessionManager?
  private var persistenceManager: FavoritesManager?
  private let nytAPIClient = NYTAPIClient()
  private var bestSellers = [[BookDetails]]()
  
  private lazy var mainView: MainView = {
    let mainView = MainView()
    mainView.bestSellersCollection.delegate = self
    mainView.bestSellersCollection.dataSource = self
    mainView.bookCategoriesPicker.delegate = self
    mainView.bookCategoriesPicker.dataSource = self
    return mainView
  }()
  private var categories = [Category]()
    override func viewDidLoad() {
      super.viewDidLoad()
      setupDelegates()
      setupView()
  }
  
  private func setupDelegates() {
    nytAPIClient.delegate = self
    nytAPIClient.getCategories()
  }
  
  private func setupView() {
    self.view = mainView
  }
  
  
  
  private func getGoogleData(isbn:String, completion:@escaping (VolumeDetail?) -> Void){
    GoogleBooksAPIClient.getImageData(isbn13: isbn) { (error, bookDetails) in
      if let error = error {
        let alertVC = UIAlertController.init(error: error)
        self.present(alertVC, animated: true, completion: nil)
        completion(nil)
      }
      
      if let bookDetails = bookDetails {
        completion(bookDetails)
      }
    }
  }
  
  
  convenience init(sessionManager: SessionManager,
                   persistenceManager: FavoritesManager,
                   categories: [Category] = [Category]()) {
    self.init()
    self.sessionManager = sessionManager
    self.persistenceManager = persistenceManager
    self.categories = categories
  }
  
  private func fetchCellImage(urlString:String) -> UIImage {
    guard var myImage = UIImage(named: "placeholder") else { fatalError("placeholder doesn't exist")}
    if let image = ImageHelper.fetchImageFromCache(urlString: urlString){
       myImage = image
    } else {
      ImageHelper.fetchImageFromNetwork(urlString: urlString) { (error, image) in
        if let error = error {
          let alertVC = UIAlertController.init(error: error)
          self.present(alertVC, animated: true, completion: nil)
        } else if let image = image {
          myImage = image
        }
      }
    }
    return myImage
  }
}


extension MainViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return bestSellers[section].count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return bestSellers.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = mainView.bestSellersCollection.dequeueReusableCell(withReuseIdentifier:"BookCell", for: indexPath) as? BookCell, bestSellers.count > 0 else { return UICollectionViewCell() }
    let bestSeller = bestSellers[indexPath.section][indexPath.row]
    cell.textLabel.text = bestSeller.author
    getGoogleData(isbn: bestSeller.primary_isbn13) { (bookDetails) in
      if let imageURL = bookDetails?.imageLinks.thumbnail {
        
      }
    }
    return cell
  }
  
}

extension MainViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let bookDetails = bestSellers[indexPath.section][indexPath.row]
    if let persistenceManager = persistenceManager {
      let detailVC = DetailViewController(persistenceManager: persistenceManager,
                                          book:bookDetails)
      navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
  }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width * 0.9 , height: collectionView.frame.height)
  }
}

extension MainViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let catergory = categories[row].list_name_encoded
    nytAPIClient.getBestSellers(category: catergory)
    sessionManager?.saveKey(value: catergory, key: "Category")
  }
}

extension MainViewController: UIPickerViewDataSource{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    guard categories.count > 0 else { return "" }
    return categories[row].list_name
  }
}

extension MainViewController: NYTAPIClientDelegate {
  func nytApiClient(_ client: NYTAPIClient, didReceiveCategories categories: [Category]) {
    self.categories = categories
    mainView.bookCategoriesPicker.reloadAllComponents()
  }
  
  func nytApiClient(_ client: NYTAPIClient, didReceiveBestSellers bestSellers: [[BookDetails]]) {
    self.bestSellers = bestSellers
    mainView.bestSellersCollection.reloadData()
  }
  
  func nytApiClient(_ client: NYTAPIClient, didReceiveError: AppError) {
    let alertVC = UIAlertController.init(error: didReceiveError)
    present(alertVC, animated: true, completion: nil)
  }
  
  
}
