//
//  HatchingInfo.swift
//  Revive
//
//  Created by Kaile Ying on 12/15/23.
//

import SwiftUI

struct FocusInfo: View {
    @State var isFocusInfoSheetShow : Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                if #available(iOS 17.0, *) {
                    VStack {
                        CommunityView()
                            .padding(.bottom)
                        Announcement_ios17()
                        Spacer()
                    }
                } else if #available(iOS 16.0, *) {
                    Announcement_ios16()
                }
                Spacer()
                
                VStack {
                    Button(action: { isFocusInfoSheetShow.toggle() }, label: {
                        Image(systemName: "info.circle")
                            .font(.title3)
                    })
                    .sheet(isPresented: $isFocusInfoSheetShow, content: {
                        NavigationStack {
                            ScrollView {
                                VStack (alignment: .leading) {
                                    
                                    Text("Hatching")
                                        .bold()
                                        .font(.title2)
                                        .foregroundStyle(Color.cBlue)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 5)
                                    
                                    VStack (alignment: .leading) {
                                        Text("1. Hatching eggs through focus.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("2. Hatching time should >= 30 minutes.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("3. Minimum hatching times are different between species. Only selecting a time greater than the certain's Species' minimum hatching time will make it possible to hatch them")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("4. SR Species probability = 5 / (100 - 0.4 * Hatching Time (min))")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                    }
                                    //                                .background(Color.cBlackBrown.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.bottom)
                                    
                                    
                                    Text("Training")
                                        .bold()
                                        .font(.title2)
                                        .foregroundStyle(Color.cBlue)
                                        .padding(.vertical, 5)
                                        .padding(.top, 5)
                                        .padding(.horizontal, 5)
                                    
                                    VStack (alignment: .leading) {
                                        Text("1. Training your own species through focus to gain EXP for them.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("2. Gain EXP = 60 * Training Time (min)")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("3. Gain Friendship = Training Time (min)")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                    }
                                    //                                .background(Color.cBlackBrown.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.bottom)
                                    
                                    
                                    Text("Exploring")
                                        .bold()
                                        .font(.title2)
                                        .foregroundStyle(Color.cBlue)
                                        .padding(.vertical, 5)
                                        .padding(.top, 5)
                                        .padding(.horizontal, 5)
                                    
                                    VStack (alignment: .leading) {
                                        Text("1. Exploring through focus to get items.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("2. Exploring time should >= 10 minutes.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("3. The next map can only be unlocked if the previous map is 100% explored.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("4. Each map has random Rewards and fixed Treasure.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("5. Random Rewards are earned every 10 minutes, and Fixed Treasure must reach the required Exploring time to be earned. ")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("6. Each map has its own terrain, and Species will have Exploring Buffs for the terrain they specialize in.")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                        Text("3. Gain Friendship = Training Time (min)")
                                            .padding(5)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.cBlack)
                                    }
                                    //                            .background(Color.cBlackBrown.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.bottom)
                                    
                                }
                            }
                            .padding()
                            .navigationTitle("Focus Information")
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button("Dismiss") {
                                        isFocusInfoSheetShow.toggle()
                                    }
                                }
                            }
                        }
                    })
                    Spacer()
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding(.vertical)
    }
}
