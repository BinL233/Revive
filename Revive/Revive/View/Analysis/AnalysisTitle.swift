//
//  AnalysisTitle.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct AnalysisTitle_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        Text("Analysis")
            .font(.custom("Georgia-Italic", size: 40))
            .padding(15)
            .bold()
            .foregroundStyle(Color.cBlack)
    }
}

@available(iOS 16.0, *)
struct AnalysisTitle_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        Text("Analysis")
            .font(.custom("Georgia-Italic", size: 40))
            .padding(15)
            .bold()
            .foregroundStyle(Color.cBlack)
    }
}
