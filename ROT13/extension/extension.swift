//
//  extension.swift
//  ROT13
//
//  Created by Bra Emma on 23/06/2021.
//

import Foundation

extension String {
    func rot13( _ version: Int) -> String{
        return ROT13.stringifyToROT(self, version )
    }
}
