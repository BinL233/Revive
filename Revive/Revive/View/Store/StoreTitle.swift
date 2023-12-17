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
        ZStack {
            Text("Seasome Hu's Store")
                .font(.custom("Georgia-Italic", size: 40))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
            HStack {
                Reminder()
                    .padding(.leading, 5)
                Spacer()
                NavigationLink(destination: SettingView()) {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundStyle(Color.cBlackBrown)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
