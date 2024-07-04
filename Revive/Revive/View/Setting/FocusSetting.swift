//
//  FocusSetting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct FocusSetting_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
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
                            manager.keepDisplay = newValue
                            UserDefaults.standard.set(manager.keepDisplay, forKey: "isKeepDisplay")
                            manager.setDisplay()
                        }
                }

            }
        } header: {
            Text("FOCUS")
        }
    }
}

@available(iOS 16.0, *)
struct FocusSetting_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Keep Screen On")
                    Spacer()
                    Toggle("", isOn: $manager.keepDisplay)
                        .labelsHidden()
                        .onChange(of: manager.keepDisplay) { newValue in
                            manager.keepDisplay = newValue
                            UserDefaults.standard.set(manager.keepDisplay, forKey: "isKeepDisplay")
                            manager.setDisplay()
                        }
                }

            }
        } header: {
            Text("FOCUS")
        }
    }
}
