//
//  PreferencesSingleton.swift
//  SingletonExample
//
//  Created by nishu nishanta on 08/05/19.
//  Copyright © 2019 nishu nishanta. All rights reserved.
//

import Foundation
class UserPreferences{
    
        enum UserCredentials: String {
            case passwordVisibile
            case password
            case username
        }
    
    static let shared = UserPreferences()
    
    private let userPreferences:UserDefaults
    private init()
    {
        userPreferences = UserDefaults.standard
    }
    
    
    func isPasswordVisible() -> Bool {
        
        let isVisible = userPreferences.bool(forKey: UserCredentials.passwordVisibile.rawValue)
        
        if isVisible {
            return true
        }
        else {
            return false
        }
    }
    
    func setPasswordVisibity(_ visible: Bool) {

        userPreferences.set(visible, forKey: UserCredentials.passwordVisibile.rawValue)
    }
    
}
