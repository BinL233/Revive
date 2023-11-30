//
//  ItemListImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import SwiftUI

struct ItemListImage: View {
    @Environment(ReviveManager.self) var manager
    @Binding var currItem : MyItems
    @Binding var currModule : MyItems?
    
    var body: some View {
        Button(action: {currModule = currItem}, label: {
            ZStack {
                if currModule == currItem {
                    Image("frame_selected")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                }

                let itemImage = String(format: "%03d", currItem.id)
                Image(itemImage)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
            }
        })
    }
}
