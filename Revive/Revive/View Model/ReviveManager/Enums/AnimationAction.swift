//
//  AnimationAction.swift
//  Revive
//
//  Created by Kaile Ying on 8/2/24.
//

import Foundation

enum AnimationAction: String, CaseIterable, Identifiable {
    case idle, touch, purchase
    var id: Self { self }
}
