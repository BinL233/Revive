//
//  ReviveManager+Dist.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import Foundation

extension ReviveManager {
    func getStandardDurations(localFocusLog: [FocusLog]) -> [DateComponents: Int] {
        let calendar = Calendar.current
        let groupedLogs = Dictionary(grouping: localFocusLog.filter { ($0.date >= calendar.date(byAdding: .day, value: -7, to: Date())!) }) { (log) -> DateComponents in
            return calendar.dateComponents([.year, .month, .weekOfYear, .day], from: log.date) }
        
        return groupedLogs.mapValues { logs in
            logs.reduce(0) { $0 + $1.duration }
        }
    }
        
    func groupAndCalculateDurations() -> [DateComponents: Int] {
        let logs = getLog()
        let calendar = Calendar.current
        
        let groupedLogs = Dictionary(grouping: logs) { (log) -> DateComponents in
            switch currDistTimeSpanSelection {
            case .week:
                return calendar.dateComponents([.year, .month, .weekOfYear, .day], from: log.date)
            case .month:
                let weekOfYear = calendar.component(.weekOfYear, from: log.date)
                return DateComponents(year: calendar.component(.year, from: log.date), weekOfYear: weekOfYear)
            case .year:
                return calendar.dateComponents([.year, .month], from: log.date)
            case .total:
                return calendar.dateComponents([.year], from: log.date)
            }
        }
        
        return groupedLogs.mapValues { logs in
            logs.reduce(0) { $0 + $1.duration }
        }
    }
    
    private func getLog() -> [FocusLog] {
        let startDate = startDate()
        
        if currDistActionSelection == .hatching {
            return focusLog.filter { ($0.date >= startDate) && $0.action == "hatching" }
        } else if currDistActionSelection == .training {
            return focusLog.filter { ($0.date >= startDate) && $0.action == "training" }
        } else if currDistActionSelection == .exploring {
            return focusLog.filter { ($0.date >= startDate) && $0.action == "exploring" }
        } else {
            return focusLog.filter { ($0.date >= startDate) }
        }
    }
    
    private func startDate() -> Date {
        let calendar = Calendar.current
        
        if currDistTimeSpanSelection == .week {
            return calendar.date(byAdding: .day, value: -7, to: Date())!
        } else if currDistTimeSpanSelection == .month {
            return calendar.date(byAdding: .month, value: -1, to: Date())!
        } else if currDistTimeSpanSelection == .year {
            return calendar.date(byAdding: .year, value: -1, to: Date())!
        } else {
            return calendar.date(byAdding: .year, value: -100, to: Date())!
        }
    }
}
