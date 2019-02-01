//
//  GoogleBook.swift
//  NYTBestsellers
//
//  Created by J on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct GoogleBookData:Codable {
   let items : [GoogleBook]?
}

struct GoogleBook: Codable {
  let volumeInfo: VolumeDetail
}

struct VolumeDetail: Codable {
  let title: String
  let authors: [String]
  let description: String
  let imageLinks: ImageLink
}

struct ImageLink: Codable{
  let smallThumbnail:String
  let thumbnail: String
}
