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
        ZStack {
            Button(action: {
                currModule = currMap
            }, label: {
                if currModule == currMap {
                    Image("mapFrameSelected\(currMap.id)")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("mapFrame\(currMap.id)")
                        .resizable()
                        .scaledToFit()
                }
            })
            
            HStack {
                Spacer()
                VStack {
                    HStack(spacing: 0) {
                        Image(systemName: "trophy.fill")
                            .foregroundStyle(Color.orange)
                        Text("\(currMap.finishedTimes)")
                            .foregroundStyle(Color.orange)
                            .bold()
                    }
                    .padding(8)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Spacer()
                }
                .padding(5)
                
                Spacer()
            }
        }
    }
}
