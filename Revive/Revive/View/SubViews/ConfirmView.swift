//
//  ReleaseConfirm.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ConfirmView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    var title: String
    var subTitle: String
    var isHold: Bool = false
    var yesColor: Color = .green
    var noColor: Color = .red
    var method: String
    
    var body: some View {
        VStack {
            VStack {
                Text(LocalizedStringKey(title))
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 30)
                    .padding([.top, .horizontal], 7)
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                
                if method == "release" {
                    Text(LocalizedStringKey(subTitle))
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 32)
                        .padding(7)
                        .bold()
                        .foregroundStyle(manager.currPanelSpecies == nil ? .black : manager.getSpecies(mySpecies: manager.currPanelSpecies!).rarity == "R" ? .blue : .purple)
                } else {
                    Text(LocalizedStringKey(subTitle))
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 32)
                        .padding(7)
                        .bold()
                        .foregroundStyle(.black)
                }
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
                        Text(LocalizedStringKey(method == "Insufficient Gold" ? "Confirm" : "YES"))
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
                                manager.addStoreItemToBag()
                                manager.currSelectStoreItem = nil
                                manager.currStoreItems = manager.getCurrStoreItems()
                                manager.deleteStaData()
                                manager.saveStaData()
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

@available(iOS 16.0, *)
struct ConfirmView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    var title: String
    var subTitle: String
    var isHold: Bool = false
    var yesColor: Color = .green
    var noColor: Color = .red
    var method: String
    
    var body: some View {
        VStack {
            VStack {
                Text(LocalizedStringKey(title))
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 30)
                    .padding([.top, .horizontal], 7)
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                
                if method == "release" {
                    Text(LocalizedStringKey(subTitle))
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 32)
                        .padding(7)
                        .bold()
                        .foregroundStyle(manager.currPanelSpecies == nil ? .black : manager.getSpecies(mySpecies: manager.currPanelSpecies!).rarity == "R" ? .blue : .purple)
                } else {
                    Text(LocalizedStringKey(subTitle))
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 32)
                        .padding(7)
                        .bold()
                        .foregroundStyle(.black)
                }
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
                        Text(LocalizedStringKey(method == "Insufficient Gold" ? "Confirm" : "YES"))
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
                                manager.addStoreItemToBag()
                                manager.currSelectStoreItem = nil
                                manager.currStoreItems = manager.getCurrStoreItems()
                                manager.deleteStaData()
                                manager.saveStaData()
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
