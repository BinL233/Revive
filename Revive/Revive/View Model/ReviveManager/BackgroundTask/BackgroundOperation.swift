//
//  BackgroundOperation.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import Foundation

@available(iOS 17.0, *)
final class BackgroundOperation_ios17: Operation {
    let manager: ReviveManager_ios17

    init(manager: ReviveManager_ios17) {
        self.manager = manager
        super.init()
    }

    override func main() {
        guard !isCancelled else { return }
        manager.timeRemaining -= 1
    }
}

@available(iOS 16.0, *)
final class BackgroundOperation_ios16: Operation {
    let manager: ReviveManager_ios16

    init(manager: ReviveManager_ios16) {
        self.manager = manager
        super.init()
    }

    override func main() {
        guard !isCancelled else { return }
        manager.timeRemaining -= 1
    }
}
