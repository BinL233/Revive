//
//  DistributionMode.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import Foundation

enum CurrDistTimeSpanSelection : Identifiable {
    var id: Self { self }
    case week, month, year, total
}

enum CurrDistActionSelection : Identifiable {
    var id: Self { self }
    case hatching, training, exploring, total
}

