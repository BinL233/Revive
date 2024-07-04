//
//  DisplayView.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct DisplayView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        ZStack {
            if manager.currAction == .hatching {
                HatchingView_ios17()
                    .frame(width: 110, height: 110)
            } else if manager.currAction == .training {
                TrainingView_ios17()
                    .padding(.horizontal)
            } else {
                ExploringView_ios17()
                    .padding(.horizontal)
            }
        }
    }
}

@available(iOS 16.0, *)
struct DisplayView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        ZStack {
            if manager.currAction == .hatching {
                HatchingView_ios16()
                    .frame(width: 100, height: 100)
            } else if manager.currAction == .training {
                TrainingView_ios16()
                    .padding(.horizontal)
            } else {
                ExploringView_ios16()
                    .padding(.horizontal)
            }
        }
    }
}
