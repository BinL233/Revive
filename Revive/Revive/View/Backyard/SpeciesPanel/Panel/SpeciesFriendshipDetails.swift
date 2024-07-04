//
//  SpeciesFriendshipDetails.swift
//  Revive
//
//  Created by Kaile Ying on 3/27/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesFriendshipDetails_ios17: View {
    @Binding var details: Bool
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        ZStack {
            Button(
                action: {
                    withAnimation(.spring(duration: 0.2)) { details = false }
                }, label: {
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 0.7, x: 2, y: 3)
                        
                        Text("\(manager.currPanelSpecies?.friendship ?? 0)")
                            .font(.subheadline)
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                            .shadow(radius: 2, x: 2, y: 3)
                    }
                })
        }
    }
}

@available(iOS 16.0, *)
struct SpeciesFriendshipDetails_ios16: View {
    @Binding var details: Bool
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        ZStack {
            Button(
                action: {
                    withAnimation(.spring(duration: 0.2)) { details = false }
                }, label: {
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 0.7, x: 2, y: 3)
                        
                        Text("\(manager.currPanelSpecies?.friendship ?? 0)")
                            .font(.subheadline)
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                            .shadow(radius: 2, x: 2, y: 3)
                    }
                })
        }
    }
}
