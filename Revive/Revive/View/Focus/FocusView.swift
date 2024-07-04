//
//  ContentView.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct FocusView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                VStack {
                    FocusTitle()
                    Spacer()
                    
                    ZStack {
                        FocusInfo()
                        DisplayView_ios17()
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        VStack {
                            Spacer()
                            HStack {
                                BuffListView_ios17()
                                    .padding(.leading, 20)
                                Spacer()
                            }
                        }
                    }
                    
                    ActionButtons_ios17()
                        .padding(.horizontal, 30)
                        .padding(.top, (manager.isHatchingBuff || manager.isRarityBuff || manager.isTrainingBuff || manager.isExploringBuff) ? 0 : 10)
                        .padding(.bottom, 10)
                    
                    if !manager.isScaledSelectView {
                        TimerModule_ios17()
                            .padding(.horizontal, 40)

                        StartButton_ios17()
                            .padding(.vertical, 20)
                            .padding(.bottom, 30)
                    }
                }
                
                // For hatching
                if manager.currAction == .hatching {
                    if manager.currHatchingState == .state3 {
                        HatchingComplete_ios17()
                            .transition(.scale)
                            .onAppear {
                                manager.isStartButtonDisabled = true
                            }
                    }
                } else if manager.currAction == .training {
                    if manager.currTrainingState == .state2 {
                        TrainingComplete_ios17()
                            .transition(.scale)
                            .onAppear {
                                manager.isStartButtonDisabled = true
                            }
                    }
                } else {
                    if manager.currExploringState == .state2 {
                        ExploringComplete_ios17()
                            .transition(.scale)
                            .onAppear {
                                manager.isStartButtonDisabled = true
                            }
                    }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct FocusView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                VStack {
                    FocusTitle()
                    Spacer()
                    
                    ZStack {
                        FocusInfo()
                        DisplayView_ios16()
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        VStack {
                            Spacer()
                            HStack {
                                BuffListView_ios16()
                                    .padding(.leading, 20)
                                Spacer()
                            }
                        }
                    }
                    
                    ActionButtons_ios16()
                        .padding(.horizontal, 30)
                        .padding(.top, (manager.isHatchingBuff || manager.isRarityBuff || manager.isTrainingBuff || manager.isExploringBuff) ? 0 : 10)
                        .padding(.bottom, 10)
                    
                    if !manager.isScaledSelectView {
                        TimerModule_ios16()
                            .padding(.horizontal, 40)

                        StartButton_ios16()
                            .padding(.vertical, 20)
                            .padding(.bottom, 30)
                    }
                }
                
                // For hatching
                if manager.currAction == .hatching {
                    if manager.currHatchingState == .state3 {
                        HatchingComplete_ios16()
                            .transition(.scale)
                            .onAppear {
                                manager.isStartButtonDisabled = true
                            }
                    }
                } else if manager.currAction == .training {
                    if manager.currTrainingState == .state2 {
                        TrainingComplete_ios16()
                            .transition(.scale)
                            .onAppear {
                                manager.isStartButtonDisabled = true
                            }
                    }
                } else {
                    if manager.currExploringState == .state2 {
                        ExploringComplete_ios16()
                            .transition(.scale)
                            .onAppear {
                                manager.isStartButtonDisabled = true
                            }
                    }
                }
            }
        }
    }
}
