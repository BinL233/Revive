//
//  AnalysisChart.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI
import Charts

@available(iOS 17.0, *)
struct AnalysisChart_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State var IndLogs : [Int] = []
    
    var body: some View {
        VStack {
            Chart {
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
            }
            .padding()
        }
    }
}

@available(iOS 16.0, *)
struct AnalysisChart_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State var IndLogs : [Int] = []
    
    var body: some View {
        VStack {
            Chart {
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
            }
            .padding()
        }
    }
}
