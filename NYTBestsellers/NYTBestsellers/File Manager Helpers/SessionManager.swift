//
//  SessionManager.swift
//  NYTBestsellers
//
//  Created by J on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class SessionManager {
  public func saveKey<T>(value:T,key:String){
    UserDefaults.standard.set(value, forKey: key)
  }
  public func getKey(key:String) -> String {
    if let value = UserDefaults.standard.object(forKey: key) as? String {
      return value
    }
    return ""
  }
  
  public func deleteKey(key:String){
    UserDefaults.standard.set(nil, forKey:key)
  }
}
