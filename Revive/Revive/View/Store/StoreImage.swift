//
//  StoreImage.swift
//  Revive
//
//  Created by Kaile Ying on 12/23/23.
//

import SwiftUI

struct StoreImage: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        ZStack {
            Image("StoreItems")
                .resizable()
                .scaledToFit()
        }
    }
}
