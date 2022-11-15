//
//  Bundle+Decodable.swift
//  HundredDays
//
//  Created by Codebucket on 15/11/22.
//

import Foundation

extension Bundle{
    func decode<T: Decodable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file)")
        }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
        return decodedData
                
    }
}
