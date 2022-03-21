//
//  UserDefaults.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.03.2022.
//

import Foundation

@propertyWrapper
struct NameUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T?

    init(key: UserDefaultKey, defaultValue: T? = nil) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T? {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}
    
@propertyWrapper
struct LevelUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T
    
    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

@propertyWrapper
struct GameScoreUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T

    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

@propertyWrapper
struct TableLeadersDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T
    
    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}
