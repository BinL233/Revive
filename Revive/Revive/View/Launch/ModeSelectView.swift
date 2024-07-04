//
//  ModeSelectView.swift
//  Revive
//
//  Created by Kaile Ying on 11/19/23.
//

import SwiftUI

struct ModeSelectView: View {
    @Binding var isTestModeOn : Bool
    @Binding var isModeSelected : Bool
    
    var body: some View {
        ZStack {
            if #available(iOS 17.0, *) {
                Color.init(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 6, x: 0, y: 4)
            } else if #available(iOS 16.0, *) {
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 6, x: 0, y: 4)
            }
            VStack {
                Text("MODE SELECTION")
                    .font(.custom("Georgia-Italic", size: 20))
                    .padding(15)
                    .bold()
                    .foregroundStyle(Color.cBlack)
                
                Spacer()
                Button {
                    isTestModeOn = false
                    isModeSelected = true
                } label: {
                    Text("USER MODE")
                        .font(.custom("Georgia-Italic", size: 17))
                        .padding(15)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                }
                .background(Color.cDarkBrown)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
                Button {
                    isTestModeOn = true
                    isModeSelected = true
                } label: {
                    Text("TEST MODE")
                        .font(.custom("Georgia-Italic", size: 17))
                        .padding(15)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                }
                .background(Color.cDarkBrown)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 180)
    }
}
