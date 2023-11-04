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
                VStack {
                    Spacer()
                    Ellipse()
                        .fill(.gray)
                        .opacity(0.5)
                        .frame(width: 90, height: 35)
                        .scaledToFit()
                }
                Image(String(manager.currHatchingEgg))
                    .resizable()
                    .scaledToFit()
            } else if manager.currAction == .training {
                
            } else {
                
            }
        }
    }
}
