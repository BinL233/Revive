//
//  StoreItemsShuffle.swift
//  Revive
//
//  Created by Kaile Ying on 1/18/24.
//

import SwiftUI

struct StoreItemsShuffle: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        HStack {
            Button(action: {manager.currStoreItems = manager.getCurrStoreItems()}, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(8)
                    .background(Color.cGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .padding(.trailing, 5)
            
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
