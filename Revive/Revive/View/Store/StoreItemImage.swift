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
    @Binding var isConfirmViewShow: Bool
    
    var body: some View {
        Button {
            isConfirmViewShow = true
            manager.currSelectStoreItem = item
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
                    
                    VStack {
                        
                        Spacer()

                        Text("\(item.name)")
                            .font(.title3)
                            .foregroundStyle(Color.cBlackBrown)

                        Text("\(manager.getItem(id: item.id).function)")
                            .font(.caption2)
                            .foregroundStyle(Color.cBlack)
                            .padding(3)
                            .background(Color.cLightBrown.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack (spacing: 5) {
                        Image("3001")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("\(item.price)")
                            .font(.title3)
                            .foregroundStyle((manager.sta[0].currCoins >= item.price) ? Color.cBlackBrown : .red)
                    }
                }
                .padding(.horizontal)
            }
        }
        .disabled(manager.sta[0].currCoins < item.price)
    }
}
