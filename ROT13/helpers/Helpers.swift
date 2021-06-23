//
//  Helpers.swift
//  ROT13
//
//  Created by Bra Emma on 23/06/2021.
//

import Foundation

struct ROT13 {
    private static var key = [Character: Character]()
    
    private static let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowercase = Array("abcdefghijklmnopqrstuvwxyz")

    static func stringifyToROT(_ text:String, _ version: Int)-> String{
            for i in 0 ..< 26 {
                self.key[self.uppercase[i]] = self.uppercase[(i + version) % 26]
                self.key[self.lowercase[i]] = self.lowercase[(i + version) % 26]
            }
        let rotString = text.map{self.key[$0] ?? $0}
        return String(rotString)
    }
}
