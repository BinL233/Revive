//
//  StoreTitle.swift
//  Revive
//
//  Created by Kaile Ying on 12/16/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct StoreTitle_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
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

@available(iOS 16.0, *)
struct StoreTitle_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
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
