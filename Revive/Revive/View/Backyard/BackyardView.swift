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
                SpeciesListView()
            }
        }
    }
}

#Preview {
    BackyardView()
        .environment(ReviveManager())
}
