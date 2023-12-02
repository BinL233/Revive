//
//  ProgressBar.swift
//  Revive
//
//  Created by Kaile Ying on 11/13/23.
//

import SwiftUI

struct ProgressBar: View {
    var color1 = Color.cBlackBrown
    var color2 = Color.cDarkOrange
    @Binding var percent : CGFloat
    var widthPercent : CGFloat = 0.8
    var height : CGFloat = 20
    
    private let minWidth: CGFloat = 20
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: UIScreen.main.bounds.width * widthPercent, height: height)
                .foregroundStyle(.black.opacity(0.1))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: max(UIScreen.main.bounds.width * widthPercent * percent, minWidth), height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                )
                .foregroundStyle(.clear)
        }
    }
}
