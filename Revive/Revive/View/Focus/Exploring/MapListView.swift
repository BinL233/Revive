//
//  MapListView.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import SwiftUI

struct MapListImage: View {
    @Environment(ReviveManager.self) var manager
    @Binding var currMap : MyMaps
    @Binding var currModule : MyMaps?
    
    var body: some View {
        Button(action: {currModule = currMap}, label: {
            ZStack {
                if currModule == currMap {
                    Image("frame_selected")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                }

                let itemImage = String(format: "%03d", currMap.id)
                Image(itemImage)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
            }
        })
    }
}
