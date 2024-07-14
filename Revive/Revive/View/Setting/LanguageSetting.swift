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
                }
            }
        }
        header: {
           Text("LANGUAGE")
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
