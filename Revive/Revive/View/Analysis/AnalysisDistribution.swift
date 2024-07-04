//
//  AnalysisDistribution.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct AnalysisDistribution_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    var body: some View {
        @Bindable var manager = manager
        VStack {
            Picker("currDistTimeSpan", selection: $manager.currDistTimeSpanSelection) {
                Text("Day").tag(CurrDistTimeSpanSelection.week)
                Text("Month").tag(CurrDistTimeSpanSelection.month)
                Text("Year").tag(CurrDistTimeSpanSelection.year)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .onChange(of: manager.currDistTimeSpanSelection) { oldValue, newValue in
                manager.currFocusLog = manager.groupAndCalculateDurations()
            }
            
            Picker("currDistAction", selection: $manager.currDistActionSelection) {
                Text("Total").tag(CurrDistActionSelection.total)
                Text("Hatching").tag(CurrDistActionSelection.hatching)
                Text("Training").tag(CurrDistActionSelection.training)
                Text("Exploring").tag(CurrDistActionSelection.exploring)
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: manager.currDistActionSelection) { oldValue, newValue in
                manager.currFocusLog = manager.groupAndCalculateDurations()
            }
            
            AnalysisChart_ios17()
        }
    }
}

@available(iOS 16.0, *)
struct AnalysisDistribution_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    var body: some View {
        VStack {
            Picker("currDistTimeSpan", selection: $manager.currDistTimeSpanSelection) {
                Text("Day").tag(CurrDistTimeSpanSelection.week)
                Text("Month").tag(CurrDistTimeSpanSelection.month)
                Text("Year").tag(CurrDistTimeSpanSelection.year)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .onChange(of: manager.currDistTimeSpanSelection) { _ in
                manager.currFocusLog = manager.groupAndCalculateDurations()
            }
            
            Picker("currDistAction", selection: $manager.currDistActionSelection) {
                Text("Total").tag(CurrDistActionSelection.total)
                Text("Hatching").tag(CurrDistActionSelection.hatching)
                Text("Training").tag(CurrDistActionSelection.training)
                Text("Exploring").tag(CurrDistActionSelection.exploring)
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: manager.currDistActionSelection) { _ in
                manager.currFocusLog = manager.groupAndCalculateDurations()
            }
            
            AnalysisChart_ios16()
        }
    }
}
