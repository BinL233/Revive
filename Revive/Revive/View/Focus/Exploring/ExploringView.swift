//
//  ExploringView.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI

struct ExploringView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ExploringView()
        .environment(ReviveManager())
}
