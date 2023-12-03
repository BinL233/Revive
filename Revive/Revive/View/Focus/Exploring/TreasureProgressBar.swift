//
//  TreasureProgressBar.swift
//  Revive
//
//  Created by Kaile Ying on 12/1/23.
//

import SwiftUI

struct TreasureProgressBar: View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @Environment(ReviveManager.self) var manager
    var widthPercent : Double
    @State var timeRemain : Int
    
    var body: some View {
        @Bindable var manager = manager
        var percentBinding: Binding<CGFloat> {
            Binding<CGFloat>(
                get: {
                    CGFloat(Double(manager.currExploringMap!.currTime - manager.getLastNextPoint().0) / Double(manager.getLastNextPoint().1 - manager.getLastNextPoint().0))
                },
                set: { _ in }
            )
        }
        
        ProgressBar(color1: .cDarkOrange, color2: .cDarkOrange, percent: percentBinding, widthPercent: widthPercent, height: 10)
            .onReceive(timer, perform: { _ in
                manager.isTreasureBarCompleted = false
                if timeRemain > 0 {
                    manager.currExploringMap!.currTime += 10
                    manager.myMaps[manager.getMyMapIndex(map: manager.currExploringMap!)].currTime += 10
                    timeRemain -= 10
                } else {
                    timer.upstream.connect().cancel()
                    manager.isTreasureBarCompleted = true
                }
            })
    }
}
