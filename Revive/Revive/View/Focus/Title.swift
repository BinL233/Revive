//
//  Title.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Focus")
            .font(.custom("Georgia-Italic", size: 40))
            .padding(15)
            .bold()
            .foregroundStyle(Color.cBlack)
    }
}

#Preview {
    Title()
}
