//
//  Persistence.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

class Persistences<ModelData:Decodable> {
    let filename : String
    let components : ModelData?
    
    init(filename : String) {
        self.filename = filename
        components = buildingsData()
        
        func buildingsData() -> ModelData? {
            let fileManager = FileManager.default
            let url = URL.documentsDirectory.appendingPathComponent(filename + ".json")
            
            var finalURL: URL
            
            if fileManager.fileExists(atPath: url.path) {
                finalURL = url
            } else {
                guard let bundleURL = Bundle.main.url(forResource: filename, withExtension: "json") else { return nil }
                finalURL = bundleURL
            }
            var data : ModelData? = nil
            do {
                let contents = try Data(contentsOf: finalURL)
                let decoder = JSONDecoder()
                data = try decoder.decode(ModelData.self, from: contents)
            } catch let DecodingError.typeMismatch(_, context) {
                print("Type mismatch for key: \(context.codingPath)")
            } catch {
                data = nil
                print(error)
            }
            return data
        }
    }
}
