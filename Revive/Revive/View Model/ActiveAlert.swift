//
//  AlertEnum.swift
//  Revive
//
//  Created by Kaile Ying on 11/6/23.
//

import Foundation

enum ActiveAlert : Identifiable {
    var id: Self { self }
    case stop, testMode
}
