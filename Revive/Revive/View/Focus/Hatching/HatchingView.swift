//
//  HatchingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/6/23.
//

import SwiftUI

struct HatchingView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        Ellipse()
            .fill(.gray)
            .opacity(0.5)
            .frame(width: 90, height: 35)
            .scaledToFit()
            .offset(CGSize(width: 0, height: 46))
        
        Image(String(manager.currHatchingEgg))
            .resizable()
            .scaledToFit()
            .frame(width: 120)
    }
}
