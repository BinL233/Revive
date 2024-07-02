//
//  ReviveManager+Setting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import Foundation
import UIKit

@available(iOS 17.0, *)
extension ReviveManager_ios17 {
    func setDisplay() {
        if keepDisplay {
            UIApplication.shared.isIdleTimerDisabled = true
        } else {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}

@available(iOS 16.0, *)
extension ReviveManager_ios16 {
    func setDisplay() {
        if keepDisplay {
            UIApplication.shared.isIdleTimerDisabled = true
        } else {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}
