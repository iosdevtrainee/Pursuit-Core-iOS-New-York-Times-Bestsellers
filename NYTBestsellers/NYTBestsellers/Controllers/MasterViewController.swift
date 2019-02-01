//
//  MasterViewController.swift
//  NYTBestsellers
//
//  Created by J on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MasterViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
        updateTabsUI()
    }
  
  private func configureTabs(){
    let persistenanceManager = FavoritesManager()
    let sessionManager = SessionManager()
    let settingsVC = SettingsViewController.init(sessionManager: sessionManager)
    let favsVC = FavoritesViewController(sessionManager: sessionManager,
                                         persistenceManager: persistenanceManager)
    let mainVC = MainViewController(sessionManager: sessionManager,
                                    persistenceManager: persistenanceManager)
    let navVC = UINavigationController(rootViewController: mainVC)
    self.setViewControllers([navVC,favsVC,settingsVC], animated: true)
  }
  
  private func updateTabsUI() {
    self.viewControllers?.forEach({ (vc) in
      switch vc {
      case let vc as UINavigationController:
        vc.tabBarItem.title = "NYT BestSellers"
        vc.tabBarItem.image = #imageLiteral(resourceName: "icons8-bookmark-filled-24.png")
      case let vc as FavoritesViewController:
        vc.tabBarItem.title = "Favorites"
        vc.tabBarItem.image = #imageLiteral(resourceName: "icons8-wish-list-filled-50.png")
      case let vc as SettingsViewController:
        vc.tabBarItem.title = "Settings"
        vc.tabBarItem.image = #imageLiteral(resourceName: "icons8-settings-filled-30.png")
      default:
        return
        }
    })
  }

}
