//
//  StoreView.swift
//  Revive
//
//  Created by Kaile Ying on 12/16/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct StoreView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        
        NavigationStack {
            ZStack {
                Background()
                
                VStack (spacing: 0) {
                    StoreTitle_ios17()
                    
                    HStack {
                        StoreItemsShuffle_ios17()
                            .padding(.horizontal)
                        Spacer()
                        CoinView_ios17()
                            .padding(.horizontal)
                    }
                    .padding(.bottom, -70)
                    
                    Spacer()
                    
                    SeasomeHuStore_ios17()
                    
                    if manager.mySpecies.count == 0 {
                        Text("Let's hatch one Species!")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding(15)
                            .padding(.vertical, 80)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                    } else {
                        if manager.sta[0].storeLvl == 0 {
                            NavigationStack {
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
                                    manager.saveStoreItems()
                                    manager.saveStaData()
                                }, label: {
                                    Text("Unlock")
                                        .bold()
                                        .foregroundStyle(Color.cWhite)
                                        .padding(.horizontal)
                                        .padding(.vertical, 5)
                                })
                                .disabled(!(manager.sta[0].currCoins >= 1000))
                                .background(manager.sta[0].currCoins >= 1000 ? Color.cGreen : .gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width)
                            .background(Color.cBlackBrown)
                        } else {
                            ScrollView {
                                ForEach(manager.currStoreItems) { item in
                                    StoreItemImage_ios17(item: item, isConfirmViewShow: $manager.isPurchaseConfirmViewShow)
                                }
                            }
                            .padding(.vertical)
                            .padding(.horizontal, 10)
                            .background(Color.cBlackBrown)
                        }
                    }
                }
                .allowsHitTesting(!manager.isPurchaseConfirmViewShow)
                
                if manager.isPurchaseConfirmViewShow {
                    Color.black.ignoresSafeArea()
                        .opacity(0.4)
                    ConfirmView_ios17(title: "Do you want to purchase", subTitle: manager.currSelectStoreItem?.name ?? "", method: "purchase")
                }
                
                if manager.isInsufficientGoldViewShow {
                    ConfirmView_ios17(title: "Insufficient Gold", subTitle: "", method: "Insufficient Gold")
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct StoreView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                VStack (spacing: 0) {
                    StoreTitle_ios16()
                    
                    HStack {
                        StoreItemsShuffle_ios16()
                            .padding(.horizontal)
                        Spacer()
                        CoinView_ios16()
                            .padding(.horizontal)
                    }
                    .padding(.bottom, -70)
                    
                    Spacer()
                    
                    SeasomeHuStore_ios16()
                    
                    if manager.mySpecies.count == 0 {
                        Text("Let's hatch one Species!")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding(15)
                            .padding(.vertical, 80)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                    } else {
                        if manager.sta[0].storeLvl == 0 {
                            NavigationStack {
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
                                    manager.saveStoreItems()
                                    manager.saveStaData()
                                }, label: {
                                    Text("Unlock")
                                        .bold()
                                        .foregroundStyle(Color.cWhite)
                                        .padding(.horizontal)
                                        .padding(.vertical, 5)
                                })
                                .disabled(!(manager.sta[0].currCoins >= 1000))
                                .background(manager.sta[0].currCoins >= 1000 ? Color.cGreen : .gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width)
                            .background(Color.cBlackBrown)
                        } else {
                            ScrollView {
                                ForEach(manager.currStoreItems) { item in
                                    StoreItemImage_ios16(item: item, isConfirmViewShow: $manager.isPurchaseConfirmViewShow)
                                }
                            }
                            .padding(.vertical)
                            .padding(.horizontal, 10)
                            .background(Color.cBlackBrown)
                        }
                    }
                }
                .allowsHitTesting(!manager.isPurchaseConfirmViewShow)
                
                if manager.isPurchaseConfirmViewShow {
                    Color.black.ignoresSafeArea()
                        .opacity(0.4)
                    ConfirmView_ios16(title: "Do you want to purchase", subTitle: manager.currSelectStoreItem?.name ?? "", method: "purchase")
                }
                
                if manager.isInsufficientGoldViewShow {
                    ConfirmView_ios16(title: "Insufficient Gold", subTitle: "", method: "Insufficient Gold")
                }
            }
        }
    }
}
