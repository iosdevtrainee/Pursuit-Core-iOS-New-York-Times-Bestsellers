//
//  GoogleBooksAPIClient.swift
//  NYTBestsellers
//
//  Created by J on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleBooksAPIClient {
  public static func getImageData(isbn13:String, completion:@escaping (AppError?, VolumeDetail?) -> Void){
    let urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn13)&key=\(Secrets.GOOGLEKEY)"
    guard let url = URL(string:urlString) else {
      completion(AppError.badURL(urlString), nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(AppError.networkError(error), nil)
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
          completion(AppError.badStatusCode(""), nil)
          return
      }
      
      if let data = data {
        do {
          let apiData = try JSONDecoder().decode(GoogleBookData.self, from: data)
          if let bookDetails = apiData.items?.first?.volumeInfo {
            completion(nil, bookDetails)
          }
          completion(nil, nil)
        } catch {
          completion(AppError.jsonDecodingError(error), nil)
        }
      }
    }
    
    task.resume()
  }
}
