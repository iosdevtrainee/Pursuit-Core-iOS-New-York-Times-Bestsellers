//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by J on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  private var sessionManager: SessionManager?
  private var categories = [Category]()
  private lazy var mainView: SettingsView = {
    let mainView = SettingsView()
    mainView.bookCategoriesPicker.delegate = self
    mainView.bookCategoriesPicker.dataSource = self
    return mainView
  }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerView()
    }
  
  convenience init(sessionManager: SessionManager){
    self.init()
    self.sessionManager = sessionManager
  }
  
  private func setupPickerView(){
    self.view = mainView
  }
  

}
extension SettingsViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
  }
}

extension SettingsViewController: UIPickerViewDataSource{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 5
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return ""
  }
}
