//
//  SingleDetails.swift
//  Revive
//
//  Created by Kaile Ying on 12/14/23.
//

import SwiftUI

struct SingleDetails: View {
    let title : String
    let data : String
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(title))
                .font(.callout)
                .italic()
                .padding(.bottom, 5)
            Spacer()
            Text(data)
                .font(.callout)
                .italic()
                .padding(.bottom, 5)
        }
    }
}
