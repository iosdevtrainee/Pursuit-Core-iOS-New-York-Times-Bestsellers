//
//  BookCategories.swift
//  NYTBestsellers
//
//  Created by J on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct CategoryData:Codable{
  public let results:[Category]
}
struct Category:Codable{
  public let list_name:String
  public let list_name_encoded: String
}
