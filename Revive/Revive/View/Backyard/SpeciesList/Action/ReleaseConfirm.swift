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
            Text("Are you sure to RELEASE \(manager.currPanelSpecies?.nickName ?? "")?")
                .font(.custom("Georgia-Italic", size: 15))
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
                
                Button {
                    manager.deleteSpecies(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate)
                    withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm.toggle() }
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


            }
        }
        .padding()
        .background(Color.cDarkBrown)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
}
