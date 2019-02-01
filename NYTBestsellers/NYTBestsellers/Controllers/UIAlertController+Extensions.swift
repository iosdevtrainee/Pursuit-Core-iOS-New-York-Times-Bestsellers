//
//  UIAlertController+Extensions.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
extension UIAlertController {
  convenience init(error: AppError) {
    self.init()
    self.title = error.localizedDescription
    self.message = error.errorMessage()
    self.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
  }
}
