//
//  LanguageModel.swift
//  Revive
//
//  Created by Kaile Ying on 7/14/24.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 17.0, *)
@Observable
class LanguageManager {
    var selectedLanguage: String = "auto" {
        didSet {
            UserDefaults.standard.set(selectedLanguage, forKey: "selectedLanguage")
        }
    }
    
    init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") {
            self.selectedLanguage = savedLanguage
        }
    }
    
    var locale: Locale {
        Locale(identifier: selectedLanguage)
    }
}
