//
//  WidgetManager.swift
//  Revive
//
//  Created by Kaile Ying on 12/5/23.
//

import Foundation
import ActivityKit

@Observable
class WidgetManager {
    var timeRemainingAct : Activity<ReviveWidgetAttributes>?
    
    init() {
        timeRemainingAct = nil
    }
    
    func endActivity() {
        let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: "", ImageName: ""), staleDate: Date())
                                                        
        Task {
            await timeRemainingAct?.end(content)
        }
    }
    
//    func startActivity() {
//        let attributes = ReviveWidgetAttributes(action: currAction.rawValue)
//        var content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: secTimeToString(time: Int(timeRemaining)), ImageName: String(currHatchingEgg)), staleDate: Date())
//        
//        switch currAction {
//        case .hatching:
//            content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: secTimeToString(time: Int(timeRemaining)), ImageName: String(currHatchingEgg)), staleDate: Date())
//        case .training:
//            content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: secTimeToString(time: Int(timeRemaining)), ImageName: String(format: "%03d",  currTrainingSpecies!.speciesID)), staleDate: Date())
//        case .exploring:
//            content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: secTimeToString(time: Int(timeRemaining)), ImageName: String(format: "%03d",  currExploringSpecies!.speciesID)), staleDate: Date())
//        }
//        
//        timeRemainingAct = try? Activity<ReviveWidgetAttributes>.request(attributes: attributes, content: content)
//    }
}
