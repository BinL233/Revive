//
//  ReviveManager+util.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
    func pauseForTwoSecondsAsync(duration: Double, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            Thread.sleep(forTimeInterval: duration)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    
    func test() {
        print("test")
    }
    
    func nonOptionalBinding<T>(_ binding: Binding<T?>) -> Binding<T>? {
        guard let value = binding.wrappedValue else {
            return nil
        }
        return Binding<T>(
            get: { value },
            set: { binding.wrappedValue = $0 }
        )
    }
}
