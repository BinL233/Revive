//
//  ReleaseConfirm.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

struct ConfirmView: View {
    @Environment(ReviveManager.self) var manager
    var title: String
    var subTitle: String
    var isHold: Bool = false
    var yesColor: Color = .green
    var noColor: Color = .red
    var method: String
    
    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 30)
                    .padding([.top, .horizontal], 7)
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                Text(subTitle)
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 32)
                    .padding(7)
                    .bold()
                    .foregroundStyle(manager.currPanelSpecies == nil ? .black : manager.getSpecies(mySpecies: manager.currPanelSpecies!).rarity == "R" ? .blue : .purple)
            }
            .padding(.vertical)
            .background(Color.cWhite)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(7)
            
            if isHold {
                Text("(Hold \"YES\" button for 3 seconds)")
                    .font(.custom("Georgia-Italic", size: 13))
                    .padding(.horizontal, 30)
                    .padding(7)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            }
            
            HStack {
                if method != "Insufficient Gold" {
                    Button {
                        if method == "release" {
                            withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm.toggle() }
                        } else if method == "purchase" {
                            withAnimation(.bouncy(duration: 0.3)) { manager.isPurchaseConfirmViewShow.toggle() }
                        }
                    } label: {
                        Text("NO")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 30)
                            .padding(7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                    }
                    .background(noColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 0.7, x: 2, y: 3)
                }
                
                ZStack {
                    Button {
                    } label: {
                        Text(method == "Insufficient Gold" ? "Confirm" : "YES")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 30)
                            .padding(7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                    }
                    .background(yesColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 0.7, x: 2, y: 3)
                }
                .simultaneousGesture(
                    LongPressGesture(minimumDuration: isHold ? 3 : 0)
                        .onEnded { _ in
                            if method == "release" {
                                withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm.toggle() }
                                manager.deleteSpecies(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate, action: "Release")
                            } else if method == "purchase" {
                                withAnimation(.bouncy(duration: 0.3)) { manager.isPurchaseConfirmViewShow.toggle() }
                                if manager.sta[0].currCoins < manager.currSelectStoreItem?.price ?? 0 {
                                    manager.isInsufficientGoldViewShow = true
                                } else {
                                    manager.addStoreItemToBag()
                                    manager.currSelectStoreItem = nil
                                }
                            } else {
                                withAnimation(.bouncy(duration: 0.3)) { manager.isInsufficientGoldViewShow.toggle() }
                            }
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
