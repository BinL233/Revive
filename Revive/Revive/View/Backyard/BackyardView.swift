//
//  BackyardView.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct BackyardView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                BackyardTitle()
                Spacer()
                SpeciesPanel_ios17()
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                SpeciesListView_ios17()
            }
            
            if manager.isReleaseConfirm {
                ConfirmView_ios17(title: "Are you sure to RELEASE", subTitle: "\(manager.currPanelSpecies?.nickName ?? "")", isHold: true, yesColor: .red, noColor: .gray, method: "release")
            }
        }
    }
}

@available(iOS 16.0, *)
struct BackyardView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                BackyardTitle()
                Spacer()
                SpeciesPanel_ios16()
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                SpeciesListView_ios16()
            }
            
            if manager.isReleaseConfirm {
                ConfirmView_ios16(title: "Are you sure to RELEASE", subTitle: "\(manager.currPanelSpecies?.nickName ?? "")", isHold: true, yesColor: .red, noColor: .gray, method: "release")
            }
        }
    }
}
