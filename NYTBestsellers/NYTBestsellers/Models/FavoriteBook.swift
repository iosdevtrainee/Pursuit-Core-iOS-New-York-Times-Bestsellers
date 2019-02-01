//
//  FavoriteBook.swift
//  NYTBestsellers
//
//  Created by J on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct FavoriteBook:Codable {
  public let bestseller: BookDetails
  public let createdAt: Date
}
