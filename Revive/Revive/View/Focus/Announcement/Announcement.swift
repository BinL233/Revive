//
//  Announcement.swift
//  Revive
//
//  Created by Kaile Ying on 7/5/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct Announcement_ios17: View {
    @State private var manager = WebFetchManager_ios17(url: "http://binltools.fun/api/download/revive_announcement.txt")
    @State var isAnnouncementShow : Bool = false

    var body: some View {
        Button(action: { isAnnouncementShow.toggle() }, label: {
            Image(systemName: "newspaper")
                .font(.title3)
        })
        .sheet(isPresented: $isAnnouncementShow, content: {
            NavigationStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        Text(manager.content)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .foregroundStyle(Color.cBlack)
                            .padding(8)
                    }
                }
                .padding()
                .navigationTitle("Announcement")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Dismiss") {
                            isAnnouncementShow.toggle()
                        }
                    }
                }
            }
        })
    }
}

@available(iOS 16.0, *)
struct Announcement_ios16: View {
    @StateObject private var manager = WebFetchManager_ios16(url: "http://binltools.fun/api/download/revive_announcement.txt")
    @State var isAnnouncementShow : Bool = false

    var body: some View {
        Button(action: { isAnnouncementShow.toggle() }, label: {
            Image(systemName: "newspaper")
                .font(.title3)
        })
        .sheet(isPresented: $isAnnouncementShow, content: {
            NavigationStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        Text(manager.content)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .foregroundStyle(Color.cBlack)
                            .padding(8)
                    }
                }
                .padding()
                .navigationTitle("Announcement")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Dismiss") {
                            isAnnouncementShow.toggle()
                        }
                    }
                }
            }
        })
    }
}
