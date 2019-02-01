//
//  FavoritesFileManager.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoritesManager {
  init(filename:String = "favorites.plist") {
    self.filename = filename
    self.currentFavorites = [FavoriteBook]()
    switch self.getFavorites() {
    case .success(let favorites):
      self.currentFavorites = favorites
    default:
      self.currentFavorites = [FavoriteBook]()
    }
  }
  
  public let filename: String
  public var currentFavorites: [FavoriteBook]
  public func saveFavorites(favorite:FavoriteBook) -> Result<Bool, AppError> {
    var updatedFavorites = currentFavorites
    updatedFavorites.append(favorite)
    let url = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
    let propertyListEncoder = PropertyListEncoder()
    do {
      let data = try propertyListEncoder.encode(updatedFavorites)
      
      do {
        try data.write(to: url, options: .atomic)
      } catch {
        return Result.error(AppError.fileSystemError(error))
      }
    } catch {
      return Result.error(AppError.propertyListEncodingError(error))
    }
    return Result.success(true)
  }
  
  public func getFavorites() -> Result<[FavoriteBook], AppError> {
    var favorites = [FavoriteBook]()
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
    
    if FileManager.default.fileExists(atPath: path) {
      if let data = FileManager.default.contents(atPath: path) {
        do{
          favorites = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
        } catch {
          return Result.error(AppError.propertyListEncodingError(error))
        }
        
      }
    }
    return Result.success(favorites)
  }
  
}

enum Result<T,E:Error> {
  case success(T)
  case error(E)
}
