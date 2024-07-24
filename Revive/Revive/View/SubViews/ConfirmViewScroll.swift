//
//  StrictInfo.swift
//  Revive
//
//  Created by Kaile Ying on 7/24/24.
//

import SwiftUI

struct ConfirmViewScroll: View {
    var info: [String]
    var title: String
    var yesColor: Color = .green
    var noColor: Color = .red
    @Binding var isConfirmOpen: Bool
    @Binding var toggle: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("Georgia-Italic", size: 35))
                .bold()
                .foregroundStyle(Color.cWhite)
            
            ScrollView {
                ForEach(info.indices, id: \.self) { i in
                    if i%2 == 0 {
                        if info[i] == "regular" {
                            Text(LocalizedStringKey(info[i+1]))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.callout)
                                .padding(.top)
                                .padding(.horizontal)
                        } else if info[i] == "bold" {
                            Text(LocalizedStringKey(info[i+1]))
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color.cWhite)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Button {
                    withAnimation(){ isConfirmOpen = false }
                } label: {
                    Text("NO")
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 30)
                        .padding(7)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                }
                .background(noColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 0.7, x: 2, y: 3)
                
                Button {
                    withAnimation(){ isConfirmOpen = false }
                    withAnimation(){ toggle.toggle() }
                } label: {
                    Text("YES")
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 30)
                        .padding(7)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                }
                .background(yesColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 0.7, x: 2, y: 3)
            }
            .padding()
        }
        .padding()
        .background(Color.cDarkBrown.opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 0.7, x: 2, y: 3)
    }
}
