//
//  AnalysisView.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct AnalysisView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                VStack {
                    AnalysisTitle()
                    Spacer()
                    Form {
                        VStack {
                            HStack {
                                Text("Details")
                                    .font(.system(size: 25))
                                    .italic()
                                    .bold()
                                    .foregroundStyle(Color.cBlackBrown)
                                    .padding(.bottom, 5)
                                Spacer()
                            }
                            AnalysisDetails()
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}
