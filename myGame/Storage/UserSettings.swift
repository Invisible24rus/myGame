//
//  UserSettings.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import Foundation

class UserSettings {
    @UserDefault(key: .name)
    var name: String?
    
    @StrongUserDefault(key: .level, defaultValue: 0)
    var level: Int
    
    @StrongUserDefault(key: .gameScore, defaultValue: 0)
    var gameScore: Int
    
    @TableLeadersDefault(key: .tableLeaders)
    var tableLeaders: [[String: Any]]?
}

private extension UserDefaultKey {
    static let level: UserDefaultKey = "Level"
    static let name: UserDefaultKey = "Name"
    static let gameScore: UserDefaultKey = "GameScore"
    static let tableLeaders: UserDefaultKey = "TableLeaders"
}
