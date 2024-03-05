//
//  SeasomeHuStore.swift
//  Revive
//
//  Created by Kaile Ying on 12/17/23.
//

import SwiftUI

struct SeasomeHuStore: View {
    var body: some View {
        let frames = ["idle_000", "idle_006", "idle_012", "idle_018", "idle_024", "idle_030", "idle_036", "idle_042", "idle_048", "idle_054", "idle_060", "idle_066", "idle_072", "idle_078", "idle_084", "idle_090", "idle_096", "idle_102", "idle_108", "idle_114", "idle_120", "idle_126", "idle_132", "idle_138", "idle_144", "idle_150", "idle_156", "idle_162", "idle_168", "idle_174", "idle_180", "idle_186", "idle_192", "idle_198", "idle_204", "idle_210"]
        
//        Image("4001")
//            .resizable()
//            .scaledToFit()
//            .frame(width: UIScreen.main.bounds.width)
//            .clipped()
        
        StoreAnimationView(frames: frames)
    }
}
