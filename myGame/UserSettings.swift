//
//  UserSettings.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import Foundation

//я повторил енум из лекции, но не очень понимаю, что значит статик и почему без него выдает ошибку? Можешь объяснить почему в принципе тут не кейс пишется, а статик лет
enum UserDefaultsKeys {
   static let name = "Name"
   static let level = "Level"
}
