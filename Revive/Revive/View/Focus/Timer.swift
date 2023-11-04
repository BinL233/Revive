//
//  Timer.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct Timer: View {
    @Binding var timeSelection : Double
    
    var body: some View {
        HStack {
            Slider(
                value: $timeSelection,
                in: 5...180,
                step: 5
            )
            .accentColor(.cDarkOrange)
        }
    }
}
