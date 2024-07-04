//
//  ItemPanelName.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ItemPanelName_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        Text(manager.getItem(id: manager.currPanelItem?.id ?? manager.myItems[0].id).name)
            .font(.system(size: 25))
            .italic()
            .bold()
            .foregroundStyle(Color.cBlackBrown)
    }
}

@available(iOS 16.0, *)
struct ItemPanelName_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        Text(manager.getItem(id: manager.currPanelItem?.id ?? manager.myItems[0].id).name)
            .font(.system(size: 25))
            .italic()
            .bold()
            .foregroundStyle(Color.cBlackBrown)
    }
}
