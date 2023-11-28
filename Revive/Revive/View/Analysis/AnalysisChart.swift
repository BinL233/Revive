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
                // ForEach(manager.currFocusLog.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                if manager.currDistTimeSpanSelection == .week {
                    ForEach(manager.getSevenDays(), id: \.self) { day in
//                        for (key, value) in manager.currFocusLog {
//                            if manager.getSevenDays().contains(key) {
//                                BarMark(x: .value("", key), y: .value("Minutes", value))
//                                    .foregroundStyle(Color.cDarkBrown)
//                            } else {
                                BarMark(x: .value("", day), y: .value("Minutes", 0))
                                    .foregroundStyle(Color.cDarkBrown)
//                            }
//                        }
                    }
                } else if manager.currDistTimeSpanSelection == .month {
                    ForEach(manager.getSixMonths(), id: \.self) { month in
//                        for (key, value) in manager.currFocusLog {
//                            if manager.getTwelveMonths().contains(String(key.prefix(3))) {
//                                BarMark(x: .value("", String(key.prefix(3))), y: .value("Minutes", value))
//                                    .foregroundStyle(Color.cDarkBrown)
//                            } else {
                                BarMark(x: .value("", month), y: .value("Minutes", 0))
                                    .foregroundStyle(Color.cDarkBrown)
//                            }
//                        }
                    }
                } else {
                    ForEach(manager.getFiveYears(), id: \.self) { year in
//                        for (key, value) in manager.currFocusLog {
//                            if manager.getTenYears().contains(String(key.suffix(4))) {
//                                BarMark(x: .value("", String(key.suffix(4))), y: .value("Minutes", value))
//                                    .foregroundStyle(Color.cDarkBrown)
//                            } else {
                                BarMark(x: .value("", year), y: .value("Minutes", 0))
                                    .foregroundStyle(Color.cDarkBrown)
                            }
//                        }
//                    }
                }
                
                if manager.currFocusLog.count != 0 {
                    RuleMark(y: .value("Average", manager.calculateAverage()))
                        .foregroundStyle(.indigo)
                        .annotation(position: .bottom, alignment: .bottomLeading) {
                            Text("Average \(manager.calculateAverage())")
                                .foregroundStyle(.blue)
                        }
                }
            }
            .padding()
        }
    }
}
