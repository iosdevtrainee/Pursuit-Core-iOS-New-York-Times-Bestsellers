//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
  public lazy var bookCategoriesPicker: UIPickerView = {
    let picker = UIPickerView()
    return picker
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame:UIScreen.main.bounds)
    setupView()
  }
  
  private func setupView(){
    self.backgroundColor = .white
    layoutPickerView()
  }
  
  private func layoutPickerView(){
    self.addSubview(bookCategoriesPicker)
    bookCategoriesPicker.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: bookCategoriesPicker, attribute: .centerX, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: bookCategoriesPicker, attribute: .centerY, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: bookCategoriesPicker, attribute: .width, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: bookCategoriesPicker, attribute: .height, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .height, multiplier: 1, constant: 0).isActive = true
    
  }
}
