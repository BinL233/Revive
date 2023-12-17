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
        ZStack {
            Image("CoinsFrame")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
        }
    }
}
