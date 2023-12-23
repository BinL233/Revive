//
//  StoreView.swift
//  Revive
//
//  Created by Kaile Ying on 12/16/23.
//

import SwiftUI

struct StoreView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                VStack (spacing: 0) {
                    StoreTitle()
                    Spacer()
                    
                    HStack {
                        Spacer()
                        CoinView()
                            .padding(.horizontal)
                    }
                    .padding(.bottom, -70)
                    
                    SeasomeHuStore()
                    
                    if manager.sta[0].storeLvl == 0 {
                        ScrollView {
                            Spacer()
                            Image(systemName: "lock.fill")
                                .foregroundStyle(Color.cWhite)
                                .font(.largeTitle)
                                .padding()
                                .padding(.top, 50)
                            
                            HStack (spacing: 5) {
                                Image("3001")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                Text("1000")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .italic()
                            }
                            .padding()
                            
                            Button(action: {
                                manager.sta[0].storeLvl += 1
                                manager.sta[0].currCoins -= 1000
                                manager.currStoreItems = manager.getCurrStoreItems()
                            }, label: {
                                Text("Unlock")
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                            })
                            .disabled(manager.sta[0].currCoins >= 1000 ? false : true)
                            .background(manager.sta[0].currCoins >= 1000 ? Color.cGreen : .gray)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .disabled(true)
                        .frame(width: UIScreen.main.bounds.width)
                        .background(Color.cBlackBrown)
                    } else {
                        ScrollView {
                            ForEach(manager.currStoreItems) { item in
                                StoreItemImage()
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 10)
                        .background(Color.cBlackBrown)
                    }
                }
            }
        }
    }
}
