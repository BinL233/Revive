//
//  ExploringComplete.swift
//  Revive
//
//  Created by Kaile Ying on 12/1/23.
//

import SwiftUI

struct ExploringComplete: View {
    @Environment(ReviveManager.self) var manager
    @Environment(WidgetManager.self) var widgetManager
    private let adaptiveCloumns = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        @Bindable var manager = manager
        var percentBinding: Binding<CGFloat> {
            Binding<CGFloat>(
                get: {
                    if manager.getLastNextPoint() == (-1, -1) {
                        return CGFloat(1)
                    }
                     return CGFloat(Double(manager.currExploringMap!.currTime - manager.getLastNextPoint().0) / Double(manager.getLastNextPoint().1 - manager.getLastNextPoint().0))
                },
                set: { _ in }
            )
        }
        
        var timeLeft: Binding<Int> {
            Binding<Int>(
                get: {
                    manager.getLastNextPoint().1 - manager.currExploringMap!.currTime
                },
                set: { _ in }
            )
        }
        
        
        ZStack {
            Color.init(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(radius: 6, x: 0, y: 4)
            VStack {
                Text("Exploring Complete!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                    .shadow(radius: 0.7, x: 0, y: 2)
                    .padding(15)
                    .background(Color.cLightYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 0.7, x: 0, y: 2)
                
//                Image("mapFrame\(manager.currExploringMap?.id ?? 5001)")
//                    .resizable()
//                    .scaledToFit()
                HStack {
                    Text("Exploration Speed:")
                        .font(.custom("Georgia-Italic", size: 12))
                        .foregroundStyle(Color.cBlack)
                    
                    let rate = manager.typeUp(increase: false)
                    Text("\(String(format: "%.2f", rate))")
                        .font(.title3)
                        .bold()
                        .italic()
                        .foregroundStyle(
                            rate == 1 ? Color.black : (
                                rate < 1.1 ? Color.green : (
                                    rate < 1.3 ? Color.blue : (
                                        rate < 1.5 ? Color.purple : (
                                            rate < 2.0 ? Color.yellow : Color.red
                                        )
                                    )
                                )
                            )
                        )
                }

                HStack {
                    Image("2001")
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                        Text("Next Treasure")
                            .font(.custom("Georgia-Italic", size: 12))
                            .bold()
                            .foregroundStyle(Color.cBlack)
//                        Text("\(manager.secTimeToString(time: manager.getNextRewardTimeRemain()))")
//                            .font(.custom("Georgia-Italic", size: 12))
//                            .bold()
//                            .foregroundStyle(Color.cBlack)
                        
                        let intValue = manager.selectedTime
                        
                        TreasureProgressBar(widthPercent: 0.5, timeRemain: intValue, percentBinding: percentBinding)
                        
                        HStack {
                            Text("\(manager.bindingSecTimeToString(time: timeLeft))")
                                .font(.custom("Georgia-Italic", size: 12))
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                            Text("Left")
                                .font(.custom("Georgia-Italic", size: 12))
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.vertical)
                
                ScrollView {
                    if !manager.currExploringFixedRewards.isEmpty {
                        VStack {
                            Text("Treasure")
                                .font(.custom("Georgia-Italic", size: 16))
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                                .shadow(radius: 0.7, x: 0, y: 2)
                                .padding(13)
                                .background(Color.cLightYellow)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 0.7, x: 0, y: 2)
                            
                            LazyVGrid(columns: adaptiveCloumns, spacing: 15, content: {
                                ForEach(Array(manager.currExploringFixedRewards.keys), id: \.self) { key in
                                    ItemsListImage(
                                        isUsedforSelection: false,
                                        currItem: $manager.itemList[key - 2001],
                                        currItemNum: manager.currExploringFixedRewards[key]!,
                                        currModule: $manager.currPanelItem
                                    )
                                }
                            })
                        }
                        .padding()
                        .background(Color.cDarkOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 2, x: 0, y: 4)
                        .padding(.bottom)
                    }
                    
                    VStack {
                        Text("Rewards")
                            .font(.custom("Georgia-Italic", size: 16))
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                            .shadow(radius: 0.7, x: 0, y: 2)
                            .padding(13)
                            .background(Color.cLightYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 0.7, x: 0, y: 2)
                        
                        LazyVGrid(columns: adaptiveCloumns, spacing: 15, content: {
                            ForEach(Array(manager.currExploringItems.keys), id: \.self) { key in
                                ItemsListImage(
                                    isUsedforSelection: false,
                                    currItem: $manager.itemList[key - 2001],
                                    currItemNum: manager.currExploringItems[key]!,
                                    currModule: $manager.currPanelItem
                                )
                            }
                        })
                    }
                    .padding()
                    .background(Color.cDarkOrange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 2, x: 0, y: 4)
                    .padding(.bottom)
                }
                    
                
                Spacer()
                
                Button(action: {
                    widgetManager.endActivity()
                    manager.isStartButtonDisabled = false
                    withAnimation{manager.changeToExploringState1()}
                }) {
                    Text("Got it")
                        .font(.custom("Georgia-Italic", size: 20))
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding(15)
                .background(manager.isTreasureBarCompleted ? Color.cDarkOrange : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 4, x: 0, y: 4)
                .disabled(!manager.isTreasureBarCompleted)
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 50)
    }
}
