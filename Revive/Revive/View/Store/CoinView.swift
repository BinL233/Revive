//
//  CoinView.swift
//  Revive
//
//  Created by Kaile Ying on 12/16/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct CoinView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        ZStack (alignment: .trailing) {
            Image("CoinsFrame")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            
            Text("\(manager.sta[0].currCoins)")
                .foregroundStyle(.white)
                .offset(CGSize(width: -8, height: 0))
        }
    }
}

@available(iOS 16.0, *)
struct CoinView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        ZStack (alignment: .trailing) {
            Image("CoinsFrame")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            
            Text("\(manager.sta[0].currCoins)")
                .foregroundStyle(.white)
                .offset(CGSize(width: -8, height: 0))
        }
    }
}
