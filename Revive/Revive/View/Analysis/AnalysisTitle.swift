//
//  AnalysisTitle.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct AnalysisTitle: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        Text("Analysis")
            .font(.custom("Georgia-Italic", size: 40))
            .padding(15)
            .bold()
            .foregroundStyle(Color.cBlack)
    }
}
