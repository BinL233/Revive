//
//  FocusSetting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct FocusSetting: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        Section {
            List {
                HStack {
                    Text("Keep Screen On")
                    Spacer()
                    Toggle("", isOn: $manager.keepDisplay)
                        .labelsHidden()
                        .onChange(of: manager.keepDisplay) { oldValue, newValue in
                            UserDefaults.standard.set(manager.keepDisplay, forKey: "isKeepDisplay")
                        }
                }
            }
        } header: {
            Text("FOCUS")
        } footer: {
            Text("Display will not off when you are focusing.")
        }
    }
}
