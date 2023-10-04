//
//  ActionButtons.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct ActionButtons: View {
    @State private var selectedAct = "Hatch"
    let action : [String] = ["Hatch", "Train", "Explore"]
    
    var body: some View {
        HStack {
            Picker("Action", selection: $selectedAct) {
                ForEach(action, id: \.self) { act in
                    Text("\(act)").tag(act)
                        .foregroundStyle(Color.cBlack)
                        .italic()
                        .bold()
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    ActionButtons()
}
