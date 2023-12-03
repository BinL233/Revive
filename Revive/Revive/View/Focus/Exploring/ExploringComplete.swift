//
//  ExploringComplete.swift
//  Revive
//
//  Created by Kaile Ying on 12/1/23.
//

import SwiftUI

struct ExploringComplete: View {
    @Environment(ReviveManager.self) var manager
    private let adaptiveCloumns = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        @Bindable var manager = manager
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
                        
                        TreasureProgressBar(widthPercent: 0.5, timeRemain: intValue)
                    }
                    .padding(.vertical)
                }
                .padding(.vertical)
                
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
                    
                
                Spacer()
                
                Button(action: {
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
        .padding(.horizontal, 50)
        .padding(.vertical, 180)
    }
}
