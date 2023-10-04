//
//  Timer.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct Timer: View {
    @State private var selectedHour = 0
    @State private var selectedMin = 10
    let hour = Array(0...5)
    let min = Array(0...59)
    
    var body: some View {
        HStack {
            Picker("Hour", selection: $selectedHour) {
                ForEach(hour, id: \.self) { hr in
                    Text("\(hr)").tag(hr)
                        .italic()
                        .bold()
                        .foregroundStyle(Color.cBlack)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100, height: 150)
            
            Text(":")
                .italic()
                .bold()
                .foregroundStyle(Color.cBlack)
            
            Picker("Minute", selection: $selectedMin) {
                ForEach(min, id: \.self) { min in
                    Text("\(min)").tag(min)
                        .italic()
                        .bold()
                        .foregroundStyle(Color.cBlack)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100, height: 150)
        }
    }
}

#Preview {
    Timer()
}
