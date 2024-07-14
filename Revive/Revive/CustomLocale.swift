//
//  CustomLocale.swift
//  Revive
//
//  Created by Kaile Ying on 7/14/24.
//

import Foundation
import SwiftUI

struct CustomLocaleKey: EnvironmentKey {
    static let defaultValue: Locale = .current
}

extension EnvironmentValues {
    var customLocale: Locale {
        get { self[CustomLocaleKey.self] }
        set { self[CustomLocaleKey.self] = newValue }
    }
}
