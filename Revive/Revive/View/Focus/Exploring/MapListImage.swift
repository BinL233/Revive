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
        Button(action: {
            currModule = currMap
        }, label: {
            if currModule == currMap {
                Image("map_frame_selected_\(currMap.id)")
                    .resizable()
                    .scaledToFit()
            } else {
                Image("map_frame_\(currMap.id)")
                    .resizable()
                    .scaledToFit()
            }
        })
    }
}
