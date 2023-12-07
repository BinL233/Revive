//
//  BuffListView.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

struct BuffListView: View {
    @Environment(ReviveManager.self) var manager
    @State var isExpand : Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            if isExpand {
                    Button {
                        withAnimation(.bouncy(duration: 0.3)){ isExpand.toggle() }
                    } label: {
                        if isExpand {
                            HStack {
                                Image(systemName: "arrow.down.right.and.arrow.up.left")
                                    .font(.headline)
                                Text("Buff")
                                    .font(.subheadline)
                                    .italic()
                            }

                        } else {
                            HStack {
                                Image(systemName: "arrow.up.left.and.arrow.down.right")
                                    .font(.headline)
                                Text("Buff")
                                    .font(.subheadline)
                                    .italic()
                            }
                        }
                    }
                
                    if !manager.isHatchingBuff && !manager.isTrainingBuff && !manager.isExploringBuff && !manager.isRarityBuff {
                        Text("No Buff")
                            .font(.title3)
                            .bold()
                            .italic()
                            .padding(30)
                    }
                    
                    if manager.isHatchingBuff {
                        Text("Hatching Time: -\(String(format: "%.2f", (1-manager.hatchingBuffRate)*100))%")
                            .font(.custom("Georgia-Italic", size: 15))
                            .bold()
                            .padding(8)
//                            .background(.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    if manager.isTrainingBuff {
                        Text("Training Time: -\(String(format: "%.2f", (1-manager.trainingBuffRate)*100))%")
                            .font(.custom("Georgia-Italic", size: 15))
                            .bold()
                            .padding(8)
//                            .background(.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    if manager.isExploringBuff {
                        Text("Exploring Time: -\(String(format: "%.2f", (1-manager.exploringBuffRate)*100))%")
                            .font(.custom("Georgia-Italic", size: 15))
                            .bold()
                            .padding(8)
//                            .background(.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    if manager.isRarityBuff {
                        Text("SR hatching rate: +\(String(format: "%.2f", manager.rarityBuffRate*100))%")
                            .font(.custom("Georgia-Italic", size: 15))
                            .bold()
                            .padding(8)
//                            .background(.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            } else {
                Button {
                    withAnimation(.bouncy(duration: 0.3)){ isExpand.toggle() }
                } label: {
                    if isExpand {
                        HStack {
                            Image(systemName: "arrow.down.right.and.arrow.up.left")
                                .font(.headline)
                            Text("Buff")
                                .font(.subheadline)
                                .italic()
                        }
                    } else {
                        HStack {
                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                                .font(.headline)
                            Text("Buff")
                                .font(.subheadline)
                                .italic()
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(.white.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 0.7, x: 2, y: 3)
    }
}
