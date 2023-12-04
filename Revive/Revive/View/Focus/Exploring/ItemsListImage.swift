//
//  ItemsListImage.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import SwiftUI

struct ItemsListImage: View {
    @Environment(ReviveManager.self) var manager
    var isUsedforSelection : Bool
    @Binding var currItem : Item
    var currItemNum : Int
    @Binding var currModule : MyItems?
    
    var body: some View {
        Button(action: {
            currModule = manager.getMyPanelItem(id: currItem.id)
        }, label: {
            if currModule?.id == currItem.id && isUsedforSelection {
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
        })
        .disabled(!isUsedforSelection)
    }
}
