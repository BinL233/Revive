//
//  WebFetchManager.swift
//  Revive
//
//  Created by Kaile Ying on 7/5/24.
//

import Foundation
import Combine

@available(iOS 17.0, *)
@Observable
class WebFetchManager_ios17 {
    var content: String = ""
    private var cancellable: AnyCancellable?
    
    init(url: String) {
        fetchContent(from: url)
    }

    private func fetchContent(from url: String) {
        guard let url = URL(string: url) else { return }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { String(data: $0.data, encoding: .utf8) ?? "Failed to load content" }
            .replaceError(with: "Failed to load content")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.content = $0 }
    }
}

@available(iOS 16.0, *)
class WebFetchManager_ios16: ObservableObject {
    @Published var content: String = ""
    private var cancellable: AnyCancellable?

    init(url: String) {
        fetchContent(from: url)
    }

    private func fetchContent(from url: String) {
        guard let url = URL(string: url) else { return }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { String(data: $0.data, encoding: .utf8) ?? "Failed to load content" }
            .replaceError(with: "Failed to load content")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.content = $0 }
    }
}
