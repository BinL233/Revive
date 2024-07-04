//
//  HatchingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/6/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct HatchingView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        ZStack {
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
}

@available(iOS 16.0, *)
struct HatchingView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        ZStack {
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
}
