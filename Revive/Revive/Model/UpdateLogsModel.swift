//
//  UpdateLogs.swift
//  Revive
//
//  Created by Kaile Ying on 7/6/24.
//

import Foundation

struct UpdateLogsModel : Identifiable, Decodable {
    let id = UUID()
    let date : String
    let text : [String]
    
    enum CodingKeys: String, CodingKey {
        case date
        case text
    }
    
    static var logs : [UpdateLogsModel]? = {
        return Persistences(filename: "UpdateLogs").components
    }()
}

extension UpdateLogsModel {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decode(String.self, forKey: .date)
        text = try values.decode([String].self, forKey: .text)
    }
}
