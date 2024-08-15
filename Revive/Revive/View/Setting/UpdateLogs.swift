//
//  UpdateLog.swift
//  Revive
//
//  Created by Kaile Ying on 7/6/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct UpdateLogs_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.updateLogs) { log in
                    VStack (alignment: .leading) {
                        Text("\(log.date)")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color.cBlue)
                            .padding(.bottom, 5)
                        
                        ForEach(log.text.indices, id: \.self) { i in
                            Text("\(log.text[i])")
                                .font(.system(size: 14))
                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Update Logs")
        }
    }
}

@available(iOS 16.0, *)
struct UpdateLogs_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.updateLogs) { log in
                    VStack (alignment: .leading) {
                        Text("\(log.date)")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color.cBlue)
                            .padding(.bottom, 5)
                        
                        ForEach(log.text.indices, id: \.self) { i in
                            Text("\(log.text[i])")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14))
                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Update Logs")
        }
    }
}
