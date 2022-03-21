//
//  UserDefaultKey.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.03.2022.
//

import Foundation

struct UserDefaultKey: RawRepresentable {
    let rawValue: String
}

extension UserDefaultKey: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        rawValue = value
    }
}
