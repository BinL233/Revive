//
//  ItemListImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ItemBYListImage_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @Binding var currItem : MyItems
    @Binding var currModule : MyItems?
    
    var body: some View {
        Button(action: {currModule = currItem}, label: {
            ZStack {
                if currModule == currItem {
                    ZStack {
                        Image("frame_selected")
                            .resizable()
                            .scaledToFit()
                        
                        Image("\(currItem.id)")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("\(currItem.amount)")
                                    .foregroundStyle(Color.cWhite)
                                    .font(.title3)
                                    .bold()
                                    .italic()
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 10)
                                    .background(Color.cBlackBrown)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                } else {
                    ZStack {
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                        
                        Image("\(currItem.id)")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("\(currItem.amount)")
                                    .foregroundStyle(Color.cWhite)
                                    .font(.title3)
                                    .bold()
                                    .italic()
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 10)
                                    .background(Color.cBlackBrown)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
            }
        })
    }
}

@available(iOS 16.0, *)
struct ItemBYListImage_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @Binding var currItem : MyItems
    @Binding var currModule : MyItems?
    
    var body: some View {
        Button(action: {currModule = currItem}, label: {
            ZStack {
                if currModule == currItem {
                    ZStack {
                        Image("frame_selected")
                            .resizable()
                            .scaledToFit()
                        
                        Image("\(currItem.id)")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("\(currItem.amount)")
                                    .foregroundStyle(Color.cWhite)
                                    .font(.title3)
                                    .bold()
                                    .italic()
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 10)
                                    .background(Color.cBlackBrown)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                } else {
                    ZStack {
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                        
                        Image("\(currItem.id)")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("\(currItem.amount)")
                                    .foregroundStyle(Color.cWhite)
                                    .font(.title3)
                                    .bold()
                                    .italic()
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 10)
                                    .background(Color.cBlackBrown)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
            }
        })
    }
}
