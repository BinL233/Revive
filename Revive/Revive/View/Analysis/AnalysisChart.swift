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
                let currFocusLogs = manager.currFocusLog
                
                ForEach(manager.currFocusLog.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    BarMark(x: .value("233", "23"), y: .value("Minutes", value))
                        .foregroundStyle(Color.cDarkBrown)
                }
                
                if manager.currFocusLog.count != 0 {
                    RuleMark(y: .value("Average", manager.calculateAverage()))
                        .foregroundStyle(.indigo)
                        .annotation(position: .bottom, alignment: .bottomLeading) {
                            Text("Average \(manager.calculateAverage())")
                                .foregroundStyle(.indigo)
                        }
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
