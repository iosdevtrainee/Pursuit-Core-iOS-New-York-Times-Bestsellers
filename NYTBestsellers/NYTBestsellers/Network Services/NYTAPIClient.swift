//
//  NYTAPIClient.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

protocol NYTAPIClientDelegate: AnyObject {
  func nytApiClient(_ client: NYTAPIClient, didReceiveCategories categories:[Category])
  func nytApiClient(_ client: NYTAPIClient, didReceiveBestSellers bestSellers:[[BookDetails]])
  func nytApiClient(_ client: NYTAPIClient, didReceiveError: AppError)
}

import Foundation
final class NYTAPIClient {
  public weak var delegate: NYTAPIClientDelegate?
  public func getBestSellers(category:String) {
    let urlString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(Secrets.NYTAPIKEY)&list=\(category)"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data) in
      if let error = error {
        self.delegate?.nytApiClient(self, didReceiveError: error)
      }
      if let data = data {
        do {
            let apiData = try JSONDecoder().decode(BookAPIData.self, from: data)
            let bookdetails = apiData.results.map {$0.book_details}
            self.delegate?.nytApiClient(self, didReceiveBestSellers: bookdetails)
        } catch {
          self.delegate?.nytApiClient(self, didReceiveError: AppError.jsonDecodingError(error))
        }
      }
    }
  }
  
  public func getCategories(){
    let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(Secrets.NYTAPIKEY)"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data) in
      if let error = error {
        self.delegate?.nytApiClient(self, didReceiveError: error)
      }
      if let data = data {
        do {
            let apiData = try JSONDecoder().decode(CategoryData.self, from: data)
            self.delegate?.nytApiClient(self, didReceiveCategories: apiData.results)
        } catch {
           self.delegate?.nytApiClient(self, didReceiveError: AppError.jsonDecodingError(error))
        }

      }
    }
  }
}
