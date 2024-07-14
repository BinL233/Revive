//
//  FontManager.swift
//  Revive
//
//  Created by Kaile Ying on 7/13/24.
//

import Foundation
import SwiftUI

class FontManager {
    static func customFont(size: CGFloat, for locale: Locale) -> Font {
        switch locale.identifier {
        case "en": // English
            return .custom("Georgia-Italic", size: size)
        case "zh": // Chinese
            return .custom("PingFangSC-Regular", size: size)
        default:
            return .system(size: 20)
        }
    }
}
