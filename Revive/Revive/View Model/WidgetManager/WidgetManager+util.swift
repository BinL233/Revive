//
//  WidgetManager+util.swift
//  Revive
//
//  Created by Kaile Ying on 12/5/23.
//

import Foundation

@available(iOS 17.0, *)
extension WidgetManager {
    func secTimeToString(time: Int) -> String {
        let time = time
        var hour : Int = 0
        var min : Int = 0
        var sec : Int = 0
        
        hour = time / 3600
        min = time % 3600 / 60
        sec = time % 60
        
        return String(hour) + ":" + String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
}
