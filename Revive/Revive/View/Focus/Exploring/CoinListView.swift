//
//  CoinListView.swift
//  Revive
//
//  Created by Kaile Ying on 12/21/23.
//

import SwiftUI

struct CoinListView: View {
    @Environment(ReviveManager.self) var manager
    var currItemNum : Int
    
    var body: some View {
        ZStack {
            Image("frame")
                .resizable()
                .scaledToFit()
            
            Image("3001")
                .resizable()
                .scaledToFit()
                .padding()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("\(currItemNum)")
                        .foregroundStyle(Color.cWhite)
                        .font(.title3)
                        .bold()
                        .italic()
                        .padding(.vertical, 3)
                        .padding(.horizontal, 8)
                        .background(Color.cBlackBrown)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .padding(.horizontal, 4)
            }
        }
    }
}
