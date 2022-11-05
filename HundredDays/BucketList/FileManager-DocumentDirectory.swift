//
//  FileManager-DocumentDirectory.swift
//  HundredDays
//
//  Created by Codebucket on 05/11/22.
//

import Foundation

extension FileManager{
    static var documentDirectory: URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
}

