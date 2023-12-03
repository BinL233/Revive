//
//  ItemPanelImage.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import SwiftUI

struct ItemPanelImage: View {
    @Binding var currPanelItem : MyItems?
    
    var body: some View {
        if currPanelItem != nil {
            ZStack {
                Image(String(currPanelItem!.id))
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
                    .padding(10)
            }
        } else {
            ZStack {
                Text("?")
                    .font(.system(size: 80))
                    .italic()
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                    .shadow(radius: 6, x: 0, y: 4)
                
            }
        }
    }
}
