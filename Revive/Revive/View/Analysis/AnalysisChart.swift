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
                        if let log = manager.currFocusLog.first(where: {$0.key.dropLast(6).dropFirst(4) == day}) {
                            BarMark(x: .value("Date", day), y: .value("Hours", Double(log.value)/60))
                                .foregroundStyle(Color.cDarkBrown)
                        } else {
                            BarMark(x: .value("Date", day), y: .value("Hours", 0))
                                .foregroundStyle(Color.cDarkBrown)
                        }
                    }
                } else if manager.currDistTimeSpanSelection == .month {
                    ForEach(manager.getSixMonths(), id: \.self) { month in
                        let log = manager.currFocusLog.first(where: { String($0.key.prefix(3)) == month })
                        if log != nil {
                            BarMark(x: .value("Date", month), y: .value("Hours", Double(log!.value)/60))
                                .foregroundStyle(Color.cDarkBrown)
                        } else {
                            BarMark(x: .value("Date", month), y: .value("Hours", 0))
                                .foregroundStyle(Color.cDarkBrown)
                        }
                    }
                } else {
                    ForEach(manager.getFiveYears(), id: \.self) { year in
                        if let log = manager.currFocusLog.first(where: {$0.key.suffix(4) == year}) {
                            BarMark(x: .value("Date", year), y: .value("Hours", Double(log.value)/60))
                                .foregroundStyle(Color.cDarkBrown)
                        } else {
                            BarMark(x: .value("Date", year), y: .value("Hours", 0))
                                .foregroundStyle(Color.cDarkBrown)
                        }
                    }
                }
                
                if manager.currFocusLog.count != 0 {
                    RuleMark(y: .value("Average", Double(manager.calculateAverage())/60))
                        .foregroundStyle(Color.cBlackRed)
                        .annotation(position: .bottom, alignment: .bottomLeading) {
                            Text("Average \(manager.secTimeToString2(time: manager.calculateAverage()))")
                                .foregroundStyle(Color.cBlackRed)
                                
                        }
                }
            }
            .padding()
        }
    }
}
