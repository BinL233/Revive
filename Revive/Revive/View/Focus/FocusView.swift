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
    @Environment(DialogManager_ios17.self) var dialogManager
    @State private var isStrictConfirmOpen: Bool = false
    @State private var tipsModeHatching: String = "Hatching"
    @State private var tipsModeExploring: String = "Exploring"
    
    var body: some View {
        @Bindable var manager = manager
        
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
                                
//                                StrictMode_ios17(isStrictConfirmOpen: $isStrictConfirmOpen)
//                                .padding(.trailing, 20)
                            }
                        }
                    }
                    
                    ActionButtons_ios17()
                        .padding(.horizontal, 30)
                        .padding(.top, (manager.isHatchingBuff || manager.isRarityBuff || manager.isTrainingBuff || manager.isExploringBuff) ? 0 : 10)
                    
                    if !manager.isScaledSelectView {
                        if manager.currAction == .hatching {
                            TipsView(isShown: isShown, mode: $tipsModeHatching)
                        } else if manager.currAction == .exploring {
                            TipsView(isShown: isShown, mode: $tipsModeExploring)
                        } else {
                            TipsView(isShown: isShown, mode: $tipsModeExploring)
                        }
                        
                        TimerModule_ios17()
                            .padding(.horizontal, 40)
                            .padding(.top, -5)

                        ZStack {
                            StartButton_ios17()
                                .padding(.vertical, 20)
                                .padding(.bottom, 30)
                        }
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
                
                if isStrictConfirmOpen {
                    ConfirmViewScroll(info: dialogManager.strictModeConfirmInfo, title: "Strict Mode", isConfirmOpen: $isStrictConfirmOpen, toggle: $manager.isStrictModeOpen)
                        .padding(.horizontal)
                        .padding(.vertical, 30)
                }
            }
        }
    }

    private var isConditionMet: Bool {
        if manager.currAction == .hatching {
            return !manager.isTimerStart && manager.timeRemaining < 30*60 && !manager.checkNoSpecies()
        } else if manager.currAction == .exploring {
            return !manager.isTimerStart && manager.timeRemaining < 10*60 && !manager.checkNoSpecies()
        } else {
            return false
        }
    }

    private var isShown: Binding<Bool> {
        Binding<Bool>(
            get: {
                if isConditionMet {
                    return true
                } else {
                    return false
                }
            },
            set: { _ in }
        )
    }
}

@available(iOS 16.0, *)
struct FocusView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @EnvironmentObject var dialogManager: DialogManager_ios16
    @State private var isStrictConfirmOpen: Bool = false
    @State private var tipsModeHatching: String = "Hatching"
    @State private var tipsModeExploring: String = "Exploring"
    
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
                                
//                                StrictMode_ios16(isStrictConfirmOpen: $isStrictConfirmOpen)
//                                .padding(.trailing, 20)
                            }
                        }
                    }
                    
                    ActionButtons_ios16()
                        .padding(.horizontal, 30)
                        .padding(.top, (manager.isHatchingBuff || manager.isRarityBuff || manager.isTrainingBuff || manager.isExploringBuff) ? 0 : 10)
                        .padding(.bottom, 10)
                    
                    if !manager.isScaledSelectView {
                        if manager.currAction == .hatching {
                            TipsView(isShown: isShown, mode: $tipsModeHatching)
                        } else if manager.currAction == .exploring {
                            TipsView(isShown: isShown, mode: $tipsModeExploring)
                        } else {
                            TipsView(isShown: isShown, mode: $tipsModeExploring)
                        }
                        
                        TimerModule_ios16()
                            .padding(.horizontal, 40)
                            .padding(.top, -5)

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
                
                if isStrictConfirmOpen {
                    ConfirmViewScroll(info: dialogManager.strictModeConfirmInfo, title: "Strict Mode", isConfirmOpen: $isStrictConfirmOpen, toggle: $manager.isStrictModeOpen)
                        .padding(.horizontal)
                        .padding(.vertical, 30)
                }
            }
        }
    }
    
    private var isConditionMet: Bool {
        if manager.currAction == .hatching {
            return !manager.isTimerStart && manager.timeRemaining < 30*60 && !manager.checkNoSpecies()
        } else if manager.currAction == .exploring {
            return !manager.isTimerStart && manager.timeRemaining < 10*60 && !manager.checkNoSpecies()
        } else {
            return false
        }
    }

    private var isShown: Binding<Bool> {
        Binding<Bool>(
            get: {
                if isConditionMet {
                    return true
                } else {
                    return false
                }
            },
            set: { _ in }
        )
    }
}
