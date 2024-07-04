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
                    if #available(iOS 17.0, *) {
                        AnalysisTitle_ios17()
                    } else if #available(iOS 16.0, *) {
                        AnalysisTitle_ios16()
                    }
                    Spacer()
                    if #available(iOS 17.0, *) {
                        AnalysisDistribution_ios17()
                    } else if #available(iOS 16.0, *) {
                        AnalysisDistribution_ios16()
                    }
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
                            
                            if #available(iOS 17.0, *) {
                                AnalysisDetails_ios17()
                            } else if #available(iOS 16.0, *) {
                                AnalysisDetails_ios16()
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}
