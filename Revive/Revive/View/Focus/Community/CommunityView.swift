//
//  CommunityView.swift
//  Revive
//
//  Created by Kaile Ying on 7/30/24.
//

import SwiftUI

struct CommunityView: View {
    @State var isCommunityViewShow : Bool = false
    
    var body: some View {
        Button(action: { isCommunityViewShow.toggle() }, label: {
            Image(systemName: "person.2.fill")
                .font(.title3)
        })
        .sheet(isPresented: $isCommunityViewShow, content: {
            NavigationStack {
                ScrollView {
                    VStack {
                        HStack {
                            Text("Discord")
                                .bold()
                                .font(.title2)
                            Spacer()
                            Button(action: {
                                openDiscordServer()
                            }) {
                                Text("Join")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(Color.cDarkBrown)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                        .background(.gray.opacity(0.15))
                        .cornerRadius(15)
                        
                        HStack {
                            Text("QQ")
                                .bold()
                                .font(.title2)
                            Spacer()
                            Button(action: {
                                openQQGroup()
                            }) {
                                Text("Join")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(Color.cDarkBrown)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                        .background(.gray.opacity(0.15))
                        .cornerRadius(15)
                    }
                }
                .padding()
                .navigationTitle("Communities")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Dismiss") {
                            isCommunityViewShow.toggle()
                        }
                    }
                }
            }
            .presentationDetents([.fraction(0.4),.medium])
        })
    }
    
    func openDiscordServer() {
        let discordInviteURL = URL(string: "https://discord.gg/5RNj2F7s")!
        
        if UIApplication.shared.canOpenURL(discordInviteURL) {
            UIApplication.shared.open(discordInviteURL, options: [:], completionHandler: nil)
        }
    }
    
    func openQQGroup() {
        let QQInviteURL = URL(string: "https://qm.qq.com/q/JdDExLgO8W")!
        
        if UIApplication.shared.canOpenURL(QQInviteURL) {
            UIApplication.shared.open(QQInviteURL, options: [:], completionHandler: nil)
        }
    }
}
