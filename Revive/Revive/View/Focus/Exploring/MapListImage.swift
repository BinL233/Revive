//
//  MapListView.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct MapListImage_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
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
                    
                    HStack(spacing: 0) {
                        Text("\(String(format: "%.1f", Double(manager.myMaps[manager.getMyMapIndex(map: currMap)].currTime) / Double(manager.getMap(map: currMap).totalTime)*100))%")
                            .foregroundStyle(Color.orange)
                            .bold()
                    }
                    .padding(8)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding(5)
                
                Spacer()
            }
        }
    }
}

@available(iOS 16.0, *)
struct MapListImage_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
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
                    
                    HStack(spacing: 0) {
                        Text("\(String(format: "%.1f", Double(manager.myMaps[manager.getMyMapIndex(map: currMap)].currTime) / Double(manager.getMap(map: currMap).totalTime)*100))%")
                            .foregroundStyle(Color.orange)
                            .bold()
                    }
                    .padding(8)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding(5)
                
                Spacer()
            }
        }
    }
}
