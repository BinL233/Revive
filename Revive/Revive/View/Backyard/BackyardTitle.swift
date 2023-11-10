//
//  BackyardTitile.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct BackyardTitle: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        Text("Backyard")
            .font(.custom("Georgia-Italic", size: 40))
            .padding(15)
            .bold()
            .foregroundStyle(Color.cBlack)
    }
}
