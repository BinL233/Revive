//
//  FocusSetting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct FocusSetting: View {
    @State var keepDisplay : Bool
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Keep Screen On")
                    Spacer()
                    Toggle("", isOn: $keepDisplay)
                        .labelsHidden()
                }
            }
        } header: {
            Text("FOCUS")
        } footer: {
            Text("Display will not off when you are focusing.")
        }
    }
}
