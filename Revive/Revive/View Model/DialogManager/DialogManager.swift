//
//  DialogManager.swift
//  Revive
//
//  Created by Kaile Ying on 6/16/24.
//

import Foundation

@available(iOS 17.0, *)
@Observable
class DialogManager_ios17 {
    var tutorialDialog1 : [String]
    var tutorialDialog2 : [String]
    var tutorialDialog3 : [String]
    
    var strictModeConfirmInfo : [String]
    
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
        
        tutorialDialog3 = {
            func loadTexts() -> [String] {
                let persistence = Persistences<[String]>(filename: "Tutorial3")
                if let loadedTexts = persistence.components {
                    return loadedTexts
                } else {
                    return ["Unknown Error"]
                }
            }
            
            return loadTexts()
        }()
        
        strictModeConfirmInfo = {
            func loadTexts() -> [String] {
                let persistence = Persistences<[String]>(filename: "StrictModeConfirmInfo")
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

@available(iOS 16.0, *)
class DialogManager_ios16: ObservableObject {
    @Published var tutorialDialog1 : [String]
    @Published var tutorialDialog2 : [String]
    @Published var tutorialDialog3 : [String]
    
    var strictModeConfirmInfo : [String]
    
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
        
        tutorialDialog3 = {
            func loadTexts() -> [String] {
                let persistence = Persistences<[String]>(filename: "Tutorial3")
                if let loadedTexts = persistence.components {
                    return loadedTexts
                } else {
                    return ["Unknown Error"]
                }
            }
            
            return loadTexts()
        }()
        
        strictModeConfirmInfo = {
            func loadTexts() -> [String] {
                let persistence = Persistences<[String]>(filename: "StrictModeConfirmInfo")
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
