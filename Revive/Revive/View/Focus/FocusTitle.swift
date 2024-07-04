//
//  Title.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct FocusTitle: View {
    
    var body: some View {
        ZStack {
            Text("Focus")
                .font(.custom("Georgia-Italic", size: 40))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
            HStack {
                if #available(iOS 17.0, *) {
                    Reminder_ios17()
                        .padding(.leading, 5)
                } else if #available(iOS 16.0, *) {
                    Reminder_ios16()
                        .padding(.leading, 5)
                }
                
                Spacer()
                
                if #available(iOS 17.0, *) {
                    NavigationLink(destination: SettingView_ios17()) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundStyle(Color.cBlackBrown)
                    }
                } else if #available(iOS 16.0, *) {
                    NavigationLink(destination: SettingView_ios16()) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundStyle(Color.cBlackBrown)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
