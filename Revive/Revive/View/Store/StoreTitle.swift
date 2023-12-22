//
//  StoreTitle.swift
//  Revive
//
//  Created by Kaile Ying on 12/16/23.
//

import SwiftUI

struct StoreTitle: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        VStack (spacing: 5) {
            Text("Seasome Hu's")
                .font(.custom("Georgia-Italic", size: 35))
                .bold()
                .foregroundStyle(Color.cBlack)
            
            Text("Store")
                .font(.custom("Georgia-Italic", size: 37))
                .bold()
                .foregroundStyle(Color.cBlack)
        }
    }
}
