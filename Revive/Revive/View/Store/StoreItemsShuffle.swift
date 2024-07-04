//
//  StoreItemsShuffle.swift
//  Revive
//
//  Created by Kaile Ying on 1/18/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct StoreItemsShuffle_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        HStack {
            Button(action: {
                if manager.sta[0].currCoins >= 100 {
                    manager.currStoreItems = manager.getCurrStoreItems()
                    manager.sta[0].currCoins -= 100
                    manager.deleteStaData()
                    manager.saveStaData()
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(8)
                    .background((manager.sta[0].currCoins >= 100 && manager.sta[0].storeLvl > 0) ? Color.cGreen : .gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .padding(.trailing, 5)
            .disabled(manager.sta[0].currCoins < 100)
            
            HStack (spacing: 5) {
                Image("3001")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text("100")
                    .font(.headline)
                    .foregroundStyle((manager.sta[0].currCoins >= 100) ? Color.cBlackBrown : .red)
            }
            .padding(3)
            .padding(.horizontal, 8)
            .background(Color.cBlackBrown.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

@available(iOS 16.0, *)
struct StoreItemsShuffle_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        HStack {
            Button(action: {
                if manager.sta[0].currCoins >= 100 {
                    manager.currStoreItems = manager.getCurrStoreItems()
                    manager.sta[0].currCoins -= 100
                    manager.deleteStaData()
                    manager.saveStaData()
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(8)
                    .background((manager.sta[0].currCoins >= 100 && manager.sta[0].storeLvl > 0) ? Color.cGreen : .gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .padding(.trailing, 5)
            .disabled(manager.sta[0].currCoins < 100)
            
            HStack (spacing: 5) {
                Image("3001")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text("100")
                    .font(.headline)
                    .foregroundStyle((manager.sta[0].currCoins >= 100) ? Color.cBlackBrown : .red)
            }
            .padding(3)
            .padding(.horizontal, 8)
            .background(Color.cBlackBrown.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
