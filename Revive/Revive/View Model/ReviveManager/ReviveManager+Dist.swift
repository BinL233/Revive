//
//  ReviveManager+Dist.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import Foundation

extension ReviveManager {
    func groupAndCalculateDurations() -> [(key: String, value: Int)] {
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

        let durations = groupedLogs.mapValues { logs in
            logs.reduce(0) { $0 + $1.duration }
        }
        
        return sortedData(data: durations, calendar: calendar)
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
    
    private func sortedData(data: [DateComponents: Int], calendar: Calendar) -> [(key: String, value: Int)] {
        return data.map { (key, value) in
            (key: dateString(from: key, calendar: calendar), value: value)
        }.sorted { $0.key < $1.key }
    }

    private func dateString(from components: DateComponents, calendar: Calendar) -> String {
        if let date = calendar.date(from: components) {
            return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
        } else {
            return "Unknown Date"
        }
    }
    
    func calculateAverage() -> Int {
        var total = 0
        for x in currFocusLog {
            total += x.value
        }
        
        return Int(total/currFocusLog.count)
    }
    
    func getSevenDays() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        _ = dateFormatter.string(from: Date())
        
        var lastSevenDays: [String] = []

        for day in 0..<7 {
            if let date = Calendar.current.date(byAdding: .day, value: -day, to: Date()) {
                let dateString = dateFormatter.string(from: date)
                lastSevenDays.append(dateString)
            }
        }
        
        lastSevenDays.reverse()
        
        return lastSevenDays
    }
    
    func getSixMonths() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        _ = dateFormatter.string(from: Date())
        
        var lastTwelveMonths: [String] = []

        for month in 0..<6 {
            if let date = Calendar.current.date(byAdding: .month, value: -month, to: Date()) {
                let dateString = dateFormatter.string(from: date)
                lastTwelveMonths.append(dateString)
            }
        }
        
        lastTwelveMonths.reverse()
        
        return lastTwelveMonths
    }
    
    func getFiveYears() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        _ = dateFormatter.string(from: Date())
        
        var lastTenYears: [String] = []

        for year in 0..<5 {
            if let date = Calendar.current.date(byAdding: .year, value: -year, to: Date()) {
                let dateString = dateFormatter.string(from: date)
                lastTenYears.append(dateString)
            }
        }
        
        lastTenYears.reverse()
        
        return lastTenYears
    }
}
