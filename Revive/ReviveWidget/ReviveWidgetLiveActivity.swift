//
//  ReviveWidgetLiveActivity.swift
//  ReviveWidget
//
//  Created by Kaile Ying on 12/5/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ReviveWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ReviveWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                Image(context.state.ImageName)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
                    .shadow(radius: 6, x: 0, y: 4)
                
                Spacer()
                
                VStack {
                    if context.state.timeLeft == "0:00:00" {
                        Text("You focused successfully!")
                            .font(.custom("Georgia-Italic", size: 33))
                            .padding(5)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                    } else {
                        Text("\(context.attributes.action.capitalized)")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding(5)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                        Text("\(context.state.timeLeft)")
                            .font(.custom("Georgia-Italic", size: 30))
                            .padding(5)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                    }
                }
                
                Spacer()
            }
            .activityBackgroundTint(Color(red: 0.8672, green: 0.9961, blue: 0.9922).opacity(0.6))
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                }
                DynamicIslandExpandedRegion(.trailing) {
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Time Left: \(context.state.timeLeft)")
                        .font(.title3)
                }
            } compactLeading: {
                Text(context.attributes.action.capitalized)
            } compactTrailing: {
            } minimal: {
                Text("\(context.state.timeLeft)")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

//extension ReviveWidgetAttributes {
//    fileprivate static var preview: ReviveWidgetAttributes {
//        ReviveWidgetAttributes(action: "World")
//    }
//}
//
//extension ReviveWidgetAttributes.ContentState {
//    fileprivate static var test: ReviveWidgetAttributes.ContentState {
//        ReviveWidgetAttributes.ContentState(timeLeft: "10", ImageName: "1001")
//     }
//}
//
//#Preview("Notification", as: .content, using: ReviveWidgetAttributes.preview) {
//   ReviveWidgetLiveActivity()
//} contentStates: {
//    ReviveWidgetAttributes.ContentState.test
//}
