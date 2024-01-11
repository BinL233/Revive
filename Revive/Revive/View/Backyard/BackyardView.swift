//
//  BackyardView.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct BackyardView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                BackyardTitle()
                Spacer()
                SpeciesPanel()
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                SpeciesListView()
            }
            
            if manager.isReleaseConfirm {
                ConfirmView(title: "Are you sure to RELEASE", subTitle: "\(manager.currPanelSpecies?.nickName ?? "")?", isHold: true, yesColor: .red, noColor: .gray, method: "release")
            }
        }
    }
}

#Preview {
    BackyardView()
        .environment(ReviveManager())
}
