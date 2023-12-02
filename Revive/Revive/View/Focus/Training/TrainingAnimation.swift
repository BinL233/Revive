//
//  ArrowUpAnimation.swift
//  Revive
//
//  Created by Kaile Ying on 12/1/23.
//

import SwiftUI

struct TrainingAnimation: View {
    @Environment(ReviveManager.self) var manager
    @State private var moveUp = false
    @State private var element: String
    @State private var color: Color
    private let images = ["baseball.fill", "basketball.fill", "soccerball.inverse",
                          "football.fill", "tennis.racket", "skateboard.fill", "gamecontroller.fill",
                          "macbook.gen1", "pencil", "rectangle.and.pencil.and.ellipsis", "skis.fill",
                          "snowboard.fill", "volleyball.fill"]
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
    
    init() {
        _element = State(initialValue: "")
        _color = State(initialValue: Color.clear)
        
        _element = State(initialValue: self.images.randomElement() ?? "baseball.fill")
        _color = State(initialValue: self.randomColor())
    }
    
    var body: some View {
        let delay = Double.random(in: 0...1)
        
        Image(systemName: element)
            .font(.title)
            .foregroundStyle(color)
            .offset(x: CGFloat(Int.random(in: -90...90)), y: CGFloat(Int.random(in: -10...30)))
            .offset(y: moveUp ? -100 : 100)
            .animation(
                Animation.linear(duration: 0.8)
                    .repeatForever(autoreverses: false),
                value: moveUp
            )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(
                        Animation.linear(duration: 0.8)
                            .repeatForever(autoreverses: false)
                    ) {
                        moveUp.toggle()
                    }
                }
            }
            .onChange(of: moveUp) {
                element = images.randomElement() ?? "baseball.fill"
                color = manager.randomColor()
            }
            .onReceive(timer) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        element = images.randomElement() ?? "baseball.fill"
                        color = randomColor()
                }
            }
    }
    
    private func randomColor() -> Color {
        Color(
            red: Double.random(in: 0.5...0.9),
            green: Double.random(in: 0.5...0.9),
            blue: Double.random(in: 0.5...0.9)
        )
    }
}
