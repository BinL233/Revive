//
//  SpeciesFriendlinessDetails.swift
//  Revive
//
//  Created by Kaile Ying on 3/27/24.
//

import SwiftUI

struct SpeciesFriendlinessDetails: View {
    @Binding var details: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.cLightYellow2)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 0.7, x: 2, y: 3)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(
                        action: {
                            withAnimation(.spring(duration: 0.2)) { details = false }
                        }, label: {
                        Image(systemName: "xmark.app.fill")
                            .font(.title)
                            .foregroundStyle(Color.cDarkOrange)
                    })
                    .padding(.trailing)
                    .padding(.top)
                    
                }
                
                Spacer()
            }
        }
    }
}
