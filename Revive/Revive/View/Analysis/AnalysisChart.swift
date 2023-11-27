//
//  AnalysisChart.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI
import Charts

struct AnalysisChart: View {
    @Environment(ReviveManager.self) var manager
    var body: some View {
        VStack {
            Chart {
                
                BarMark(x: .value("234", "23"), y: .value("Minutes", 1))
                    .foregroundStyle(Color.cDarkBrown)
                
                RuleMark(y: .value("Average", 1.5))
                    .foregroundStyle(Color.cBlackBrown)
                    .annotation(position: .bottom, alignment: .bottomLeading) {
                        Text("Average 1.5")
                    }
            }
            .padding()
        }
    }
}

#Preview {
    AnalysisChart()
        .environment(ReviveManager())
}
