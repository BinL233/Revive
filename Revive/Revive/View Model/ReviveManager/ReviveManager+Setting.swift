//
//  ReviveManager+Setting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import Foundation
import UIKit

extension ReviveManager {
    func setDisplay() {
        if keepDisplay {
            UIApplication.shared.isIdleTimerDisabled = true
        } else {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}
