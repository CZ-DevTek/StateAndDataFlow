//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Carlos Garcia Perez on 25/4/24.
//

import Foundation
import SwiftUI

class StorageManager {
    static let shared = StorageManager()
    
    private init() { }
    
    @AppStorage("userName") var userName = ""
    @AppStorage("isRegistered") var isRegistered = false
    
    func setUserName(_ name: String) {
        userName = name
    }
    
    func getUserName() -> String {
        userName
    }
  
    func setRegistrationStatus(_ status: Bool) {
        isRegistered = status
    }

    func getRegistrationStatus() -> Bool {
        isRegistered
    }

    func clearUserData() {
        userName = ""
        isRegistered = false
    }
}
