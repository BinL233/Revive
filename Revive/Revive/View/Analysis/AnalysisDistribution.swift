//
//  AnalysisDistribution.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI

struct AnalysisDistribution: View {
    @Environment(ReviveManager.self) var manager
    var body: some View {
        @Bindable var manager = manager
        VStack {
            Picker("currDistTimeSpan", selection: $manager.currDistTimeSpanSelection) {
                Text("Total").tag(CurrDistTimeSpanSelection.total)
                Text("Week").tag(CurrDistTimeSpanSelection.week)
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
                Text("Explorinh").tag(CurrDistActionSelection.exploring)
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: manager.currDistActionSelection) { oldValue, newValue in
                manager.currFocusLog = manager.groupAndCalculateDurations()
            }
            
            AnalysisChart()
        }
    }
}

#Preview {
    AnalysisDistribution()
        .environment(ReviveManager())
}
