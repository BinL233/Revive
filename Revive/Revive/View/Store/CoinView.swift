//
//  CoinView.swift
//  Revive
//
//  Created by Kaile Ying on 12/16/23.
//

import SwiftUI

struct CoinView: View {
    @Environment(ReviveManager.self) var manager
    
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
