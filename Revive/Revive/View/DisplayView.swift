//
//  DisplayView.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import SwiftUI

struct DisplayView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        ZStack {
            if manager.currAction == .hatching {
                HatchingView()
                    .padding(60)
            } else if manager.currAction == .training {
                TrainingView()
                    .padding(.horizontal)
            } else {
                ExploringView()
                    .padding(.horizontal)
            }
        }
    }
}
