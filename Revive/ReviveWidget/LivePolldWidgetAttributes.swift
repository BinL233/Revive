//
//  LivePolldWidgetAttributes.swift
//  Revive
//
//  Created by Kaile Ying on 12/5/23.
//

import Foundation
import ActivityKit

struct ReviveWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        // var emoji: String
        var timeLeft: String
        var ImageName: String
    }

    // Fixed non-changing properties about your activity go here!
    var action : String
}
