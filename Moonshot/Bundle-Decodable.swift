//
//  Bundle-Decodable.swift
//  HundredDays
//
//  Created by Codebucket on 01/10/22.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Could not load bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to decode \(file)")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file)")
        }
        
        return loaded
    }
    
    
}
