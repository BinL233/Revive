//
//  LanguageSetting.swift
//  Revive
//
//  Created by Kaile Ying on 7/14/24.
//

import SwiftUI


@available(iOS 17.0, *)
struct LanguageSetting_ios17: View {
    @Environment(LanguageManager.self) var manager
    @Environment(ReviveManager_ios17.self) var reviveManager
    
    var body: some View {
        @Bindable var manager = manager
        
        Section {
            List {
                HStack {
//                    Button("Chinese Simplified") {
//                        // code to update user defaults omitted...
//
//                        manager.selectedLanguage = "zh-Hans"
//                    }
                    
                    Picker("Select Language", selection: $manager.selectedLanguage) {
                        Text("English").tag("en")
                        Text("简体中文").tag("zh")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .disabled(reviveManager.isTimerStart)
                }
            }
        }
        header: {
           Text("LANGUAGE")
        } footer: {
            if reviveManager.isTimerStart {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(Color.orange)
                    
                    Text("You cannot change languages during Focus.")
                        .foregroundStyle(Color.orange)
                    
                    Spacer()
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct LanguageSetting_ios16: View {
    @State private var selectedLanguage: String? = nil
    
    var body: some View {
        Section {
            List {
                HStack {
                    Picker("Select Language", selection: $selectedLanguage) {
                        Text("English")
                        Text("简体中文")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .disabled(true)
                }
            }
        }
        header: {
           Text("LANGUAGE")
        } footer: {
            Text("Only avaliable to iOS 17 or later. Currently follows the system language.")
        }
    }
}
