//
//  BookCell.swift
//  NYTBestsellers
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
  lazy public var textLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    return label
  }()
  
  lazy public var image: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("This app has not implemented storyboard based views")
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  private func setupView(){
    backgroundColor = .white
  }
  private func setupLabel(){
    addSubview(textLabel)
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: 10).isActive = true
    NSLayoutConstraint(item: textLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.8, constant: 0).isActive = true
    NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .height, multiplier: 0.1, constant: 0).isActive = true
  }
  
  private func setupImageView(){
    addSubview(image)
    image.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
    NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .height, multiplier: 0.5, constant: 0).isActive = true
  }
}
