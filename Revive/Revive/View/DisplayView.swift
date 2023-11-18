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
            } else if manager.currAction == .training {
                TrainingView()
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .padding(.horizontal)
            } else {
                
            }
        }
    }
}
