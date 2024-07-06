//
//  UpdateLogsLink.swift
//  Revive
//
//  Created by Kaile Ying on 7/6/24.
//

import SwiftUI

struct UpdateLogsLink: View {
    var body: some View {
        Section {
            List {
                if #available(iOS 17.0, *) {
                    NavigationLink(destination: UpdateLogs_ios17()) {
                        Text("Update Logs")
                    }
                } else if #available(iOS 16.0, *) {
                    NavigationLink(destination: UpdateLogs_ios16()) {
                        Text("Update Logs")
                    }
                }
            }
        }
        footer: {
           Text("Check these logs to track the growth of Revive.")
        }
    }
}
