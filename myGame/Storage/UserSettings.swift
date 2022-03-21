//
//  UserSettings.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import Foundation


//enum UserDefaultsKeys {
//
//
//    static let name = "Name"
//    static let level = "Level"
//    static let gameScore = "score"
//}

class UserSettings {
    @NameUserDefault(key: .name, defaultValue: "No Name")
    var name: String?
    
    @LevelUserDefault(key: .level, defaultValue: 0)
    var level: Int
    
    @GameScoreUserDefault(key: .gameScore, defaultValue: 0)
    var gameScore: Int
    
    @TableLeadersDefault(key: .tableLeaders, defaultValue: [["No name": 0]])
    var tableLeaders: [[String: Int]]
}

private extension UserDefaultKey {
    static let level: UserDefaultKey = "Level"
    static let name: UserDefaultKey = "Name"
    static let gameScore: UserDefaultKey = "GameScore"
    static let tableLeaders: UserDefaultKey = "TableLeaders"
}