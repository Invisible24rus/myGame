//
//  SettingsViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let backgroundImage = UIImageView(image: UIImage(named: "backgroundImage"))
    private let profileNameLabel = UILabel()
    private let levelNameLabel = UILabel()
    private let userNameTextField = UITextField()
    private let saveSettingsButton = UIButton(type: .system)
    private let levelSegmentedControl = UISegmentedControl(items: ["Лето", "Космос", "Зима"])


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

  

}

//MARK: - Extension

private extension SettingsViewController {
    
    func setupViews() {
         
        title = "Настройки"
        
        backgroundImage.contentMode = .scaleAspectFill
        
        view.addSubviewsForAutoLayout([backgroundImage,profileNameLabel, userNameTextField, saveSettingsButton, levelNameLabel, levelSegmentedControl])
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        profileNameLabel.text = "Имя профиля"
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        profileNameLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        ])
        
        userNameTextField.backgroundColor = .white
        userNameTextField.borderStyle = .line
        userNameTextField.text = UserDefaults.standard.string(forKey: UserDefaultsKeys.name)
        userNameTextField.placeholder = "Введите свое имя"
        
        NSLayoutConstraint.activate([
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userNameTextField.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 10),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        levelNameLabel.text = "Уровень"
        levelNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        levelNameLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            levelNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            levelNameLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
        ])
        
        levelSegmentedControl.backgroundColor = .white
        levelSegmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: UserDefaultsKeys.level)
        
        NSLayoutConstraint.activate([
            levelSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            levelSegmentedControl.topAnchor.constraint(equalTo: levelNameLabel.bottomAnchor, constant: 10),

        ])

        saveSettingsButton.setTitle("Применить", for: .normal)
        saveSettingsButton.setTitleColor(.white, for: .normal)
        saveSettingsButton.backgroundColor = .systemBlue
        saveSettingsButton.layer.cornerRadius = 20
        saveSettingsButton.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            saveSettingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveSettingsButton.topAnchor.constraint(equalTo: levelSegmentedControl.bottomAnchor, constant: 20),
            saveSettingsButton.widthAnchor.constraint(equalToConstant: 120),
            saveSettingsButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        
    }


    @objc func saveSettings() {
        UserDefaults.standard.set(userNameTextField.text, forKey: UserDefaultsKeys.name)
        UserDefaults.standard.set(levelSegmentedControl.selectedSegmentIndex, forKey: UserDefaultsKeys.level)
        navigationController?.popViewController(animated: true)
    }
}


