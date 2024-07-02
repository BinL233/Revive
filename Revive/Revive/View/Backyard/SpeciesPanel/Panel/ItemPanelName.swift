//
//  ItemPanelName.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import SwiftUI

struct ItemPanelName: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        Text(manager.getItem(id: manager.currPanelItem?.id ?? manager.myItems[0].id).name)
            .font(.system(size: 25))
            .italic()
            .bold()
            .foregroundStyle(Color.cBlackBrown)
    }
}
