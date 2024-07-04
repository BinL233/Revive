//
//  TreasureProgressBar.swift
//  Revive
//
//  Created by Kaile Ying on 12/1/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct TreasureProgressBar_ios17: View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @Environment(ReviveManager_ios17.self) var manager
    var widthPercent : Double
    @State var timeRemain : Int
    @Binding var percentBinding : CGFloat
    
    var body: some View {
        @Bindable var manager = manager
        
        ProgressBar(color1: .cDarkOrange, color2: .cDarkOrange, percent: $percentBinding, widthPercent: widthPercent, height: 10)
            .onReceive(timer, perform: { _ in
                manager.isTreasureBarCompleted = false
                
                if timeRemain > 0 {
                    manager.currExploringMap!.currTime += 10
                    
                    timeRemain -= 10
                } else {
                    timer.upstream.connect().cancel()
                    manager.currExploringMap = manager.myMaps[0]
                    manager.isTreasureBarCompleted = true
                }
            })
            .shadow(radius: 0.8, x: 0, y: 1)
    }
}

@available(iOS 16.0, *)
struct TreasureProgressBar_ios16: View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @EnvironmentObject var manager: ReviveManager_ios16
    var widthPercent : Double
    @State var timeRemain : Int
    @Binding var percentBinding : CGFloat
    
    var body: some View {
        ProgressBar(color1: .cDarkOrange, color2: .cDarkOrange, percent: $percentBinding, widthPercent: widthPercent, height: 10)
            .onReceive(timer, perform: { _ in
                manager.isTreasureBarCompleted = false
                
                if timeRemain > 0 {
                    manager.currExploringMap!.currTime += 10
                    
                    timeRemain -= 10
                } else {
                    timer.upstream.connect().cancel()
                    manager.currExploringMap = manager.myMaps[0]
                    manager.isTreasureBarCompleted = true
                }
            })
            .shadow(radius: 0.8, x: 0, y: 1)
    }
}
