//
//  StoreImage.swift
//  Revive
//
//  Created by Kaile Ying on 12/23/23.
//

import SwiftUI

struct StoreItemImage: View {
    @Environment(ReviveManager.self) var manager
    @State var item: StoreItems
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                Image("StoreItems")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Image("\(item.id)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                    
                    Spacer()
                    
                    Text("\(item.name)")
                        .font(.title3)
                        .foregroundStyle(Color.cBlackBrown)
                    
                    Spacer()
                    
                    HStack (spacing: 5) {
                        Image("3001")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("\(item.price)")
                            .font(.title3)
                            .foregroundStyle(Color.cBlackBrown)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
