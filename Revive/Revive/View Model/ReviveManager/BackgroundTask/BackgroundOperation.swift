//
//  BackgroundOperation.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import Foundation

final class BackgroundOperation: Operation {
    let manager: ReviveManager

    init(manager: ReviveManager) {
        self.manager = manager
        super.init()
    }

    override func main() {
        guard !isCancelled else { return }
        manager.timeRemaining -= 1
    }
}
