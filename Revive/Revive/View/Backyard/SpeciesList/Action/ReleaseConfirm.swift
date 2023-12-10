//
//  ReleaseConfirm.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

struct ReleaseConfirm: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        VStack {
            VStack {
                Text("Are you sure to RELEASE")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 30)
                    .padding([.top, .horizontal], 7)
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                Text("\(manager.currPanelSpecies?.nickName ?? "")?")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 30)
                    .padding(7)
                    .bold()
                    .foregroundStyle(manager.currPanelSpecies == nil ? .black : manager.getSpecies(mySpecies: manager.currPanelSpecies!).rarity == "R" ? .blue : .purple)
            }
                .background(Color.cWhite)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(7)
            
            Text("(Hold \"YES\" button for 3 seconds)")
                .font(.custom("Georgia-Italic", size: 13))
                .padding(.horizontal, 30)
                .padding(7)
                .bold()
                .foregroundStyle(Color.cWhite)
            HStack {
                Button {
                    withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm.toggle() }
                } label: {
                    Text("NO")
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 30)
                        .padding(7)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                }
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 0.7, x: 2, y: 3)
                
                ZStack {
                    Button {
                    } label: {
                        Text("YES")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 30)
                            .padding(7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 0.7, x: 2, y: 3)
                }
                .simultaneousGesture(
                    LongPressGesture(minimumDuration: 3)
                        .onEnded { _ in
                            withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm.toggle() }
                            manager.deleteSpecies(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate, action: "Release")
                        }
                )


            }
        }
        .padding()
        .background(Color.cDarkBrown.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 0.7, x: 2, y: 3)
    }
    
}
