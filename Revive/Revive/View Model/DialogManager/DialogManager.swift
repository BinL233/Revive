//
//  DialogManager.swift
//  Revive
//
//  Created by Kaile Ying on 6/16/24.
//

import Foundation

@Observable
class DialogManager {
    var tutorialDialog1 : [String]
    var tutorialDialog2 : [String]
    
    init() {
        tutorialDialog1 = {
            func loadTexts() -> [String] {
                let persistence = Persistences<[String]>(filename: "Tutorial1")
                if let loadedTexts = persistence.components {
                    return loadedTexts
                } else {
                    return ["Unknown Error"]
                }
            }
            
            return loadTexts()
        }()
        
        tutorialDialog2 = {
            func loadTexts() -> [String] {
                let persistence = Persistences<[String]>(filename: "Tutorial2")
                if let loadedTexts = persistence.components {
                    return loadedTexts
                } else {
                    return ["Unknown Error"]
                }
            }
            
            return loadTexts()
        }()
    }
}
