//
//  TipsView.swift
//  Revive
//
//  Created by Kaile Ying on 7/14/24.
//

import SwiftUI

struct TipsView: View {
    @Binding var isShown: Bool
    @Binding var mode: String
    
    var body: some View {
        if isShown {
            HStack {
                Spacer()
                
                Image(systemName: "exclamationmark.circle")
                    .font(.footnote)
                    .foregroundStyle(Color.orange)
                
                if mode == "Hatching" {
                    Text("Hatching time requires at least 30 minutes.")
                        .font(.footnote)
                        .foregroundStyle(Color.orange)
                } else if mode == "Exploring" {
                    Text("Exploring time requires at least 10 minutes.")
                        .font(.footnote)
                        .foregroundStyle(Color.orange)
                }
                
                Spacer()
            }
        } else {
            Text("   ")
                .font(.footnote)
                .foregroundStyle(Color.orange)
        }
    }
}
