//
//  CurrAction.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

enum CurrAction: String, CaseIterable, Identifiable {
    case hatching, training, exploring
    var id: Self { self }
}
