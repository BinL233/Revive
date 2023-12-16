//
//  HatchingInfo.swift
//  Revive
//
//  Created by Kaile Ying on 12/15/23.
//

import SwiftUI

struct FocusInfo: View {
    @State var isFocusInfoSheetShow : Bool = false
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Spacer()
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
                                    .font(.title3)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 5)
                                
                                VStack (alignment: .leading) {
                                    Text("1. Hatching eggs through focus.")
                                        .padding(5)
                                    Text("2. Hatching time should >= 30 minutes.")
                                        .padding(5)
                                    Text("3. Minimum hatching times are different between species. Only selecting a time greater than the certain's Species' minimum hatching time will make it possible to hatch them")
                                        .padding(5)
                                    Text("4. SR Species probability = 10% + 0.34% * Hatching Time (min)")
                                        .padding(5)
                                }
                                .padding(5)
                                .background(Color.cBlackBrown.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                
                                Text("Training")
                                    .bold()
                                    .font(.title3)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 5)
                                
                                VStack (alignment: .leading) {
                                    Text("1. Training your own species through focus to gain EXP for them.")
                                        .padding(5)
                                    Text("2. EXP = 60 * Training Time (min)")
                                        .padding(5)
                                }
                                .padding(5)
                                .background(Color.cBlackBrown.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                
                                Text("Exploring")
                                    .bold()
                                    .font(.title3)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 5)
                                
                                VStack (alignment: .leading) {
                                    Text("1. Exploring through focus to get items.")
                                        .padding(5)
                                    Text("2. Exploring time should >= 10 minutes.")
                                        .padding(5)
                                    Text("3. The next map can only be unlocked if the previous map is 100% explored.")
                                        .padding(5)
                                    Text("4. Each map has random Rewards and fixed Treasure.")
                                        .padding(5)
                                    Text("5. Random Rewards are earned every 10 minutes, and Fixed Treasure must reach the required Exploring time to be earned. ")
                                        .padding(5)
                                    Text("6. Each map has its own terrain, and Species will have Exploring Buffs for the terrain they specialize in.")
                                        .padding(5)
                            }
                            .padding(5)
                            .background(Color.cBlackBrown.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                
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
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding(.vertical)
    }
}
