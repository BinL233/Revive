//
//  LinkToCollections.swift
//  Revive
//
//  Created by Kaile Ying on 7/11/24.
//

import SwiftUI

struct LinkToCollections: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            NavigationLink(destination: Collections_ios17()) {
                Text("Check Your Collections")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 13)
                    .padding(.vertical, 7)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            }
            .background(Color.cdimBlue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 0.7, x: 2, y: 3)
        } else if #available(iOS 16.0, *) {
            NavigationLink(destination: Collections_ios16()) {
                Text("Check Your Collections")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 13)
                    .padding(.vertical, 7)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            }
            .background(Color.cdimBlue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 0.7, x: 2, y: 3)
        }
    }
}
