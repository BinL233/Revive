//
//  FriendshipImage.swift
//  Revive
//
//  Created by Kaile Ying on 6/21/24.
//

import SwiftUI

struct FriendshipImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.white.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 0.7, x: 2, y: 3)
    }
}
