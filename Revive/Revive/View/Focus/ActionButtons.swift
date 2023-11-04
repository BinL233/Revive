//
//  ActionButtons.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct ActionButtons: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        HStack {
            Button(action: {manager.currAction = .hatching}) {
                Text("Hatching")
                    .foregroundStyle(Color.cBlack)
                    .font(.custom("Georgia-Italic", size: 15))
            }
            .padding(15)
            .background((manager.currAction == .hatching) ? Color.cLightBrown : .clear)
            .animation(.easeInOut(duration: 0.2), value: manager.currAction)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Button(action: {manager.currAction = .training}) {
                Text("Training")
                    .foregroundStyle(Color.cBlack)
                    .font(.custom("Georgia-Italic", size: 15))
            }
            .padding(15)
            .background((manager.currAction == .training) ? Color.cLightBrown : .clear)
            .animation(.easeInOut(duration: 0.2), value: manager.currAction)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Button(action: {manager.currAction = .exploring}) {
                Text("Exploring")
                    .foregroundStyle(Color.cBlack)
                    .font(.custom("Georgia-Italic", size: 15))
            }
            .padding(15)
            .background((manager.currAction == .exploring) ? Color.cLightBrown : .clear)
            .animation(.easeInOut(duration: 0.2), value: manager.currAction)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    ActionButtons()
        .environment(ReviveManager())
}
