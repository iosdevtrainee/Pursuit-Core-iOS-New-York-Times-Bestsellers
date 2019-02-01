//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by J on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {
  public var image: UIImageView = {
    let iv = UIImageView()
    return iv
  }()
  
  public var authorLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    return label
  }()
  
  public var textView: UITextView = {
    let tv = UITextView()
    tv.textColor = .black
    return tv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  convenience init(message: BookDetails) {
    self.init()
    setupView()
  }
  
  private func setupView(){
    self.backgroundColor = .white
    constrainImage()
    constrainLabel()
//    constrainTextView()
  }
  
  private func configureSaveButton(){
//    saveButton
  }
  
  private func constrainLabel(){
    addSubview(authorLabel)
    authorLabel.translatesAutoresizingMaskIntoConstraints = false
    authorLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: 10).isActive = true
    authorLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
    authorLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05, constant: 0).isActive = true
  }
  
  private func constrainImage(){
    addSubview(image)
    image.translatesAutoresizingMaskIntoConstraints = false
    image.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
    image.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
    NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerY, multiplier: 0.6, constant: 0).isActive = true
  }
  
  private func constrainTextView(){
    addSubview(textView)
    textView.translatesAutoresizingMaskIntoConstraints = false
  }

}
