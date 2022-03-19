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
    private let levelSegmentedControl = UISegmentedControl(items: ["Космос", "Лето"])


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupText()
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
        profileNameLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        ])
        
        levelNameLabel.text = "Уровень"
        levelNameLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            levelNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            levelNameLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),
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
        
        saveSettingsButton.setTitle("Применить", for: .normal)
        saveSettingsButton.setTitleColor(.white, for: .normal)
        saveSettingsButton.backgroundColor = .systemBlue
        saveSettingsButton.layer.cornerRadius = 20
        saveSettingsButton.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            saveSettingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveSettingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            saveSettingsButton.widthAnchor.constraint(equalToConstant: 120),
            saveSettingsButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        levelSegmentedControl.backgroundColor = .white
//        Вот тут вопрос, если мы делаем выбор уровня через сегмент. То при первом запуске игры, должен же быть уже выбран какой то сегмент по умолчанию, и только если игрок пошел в настройки перевыбрал его, мы уже строчкой ниже перезаписываем. Как это должно выглядеть в правильном исполнении?
        levelSegmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: UserDefaultsKeys.level)
        
        NSLayoutConstraint.activate([
            levelSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            levelSegmentedControl.topAnchor.constraint(equalTo: levelNameLabel.bottomAnchor, constant: 10),

        ])
        
    }
// Не уверен, что через массив это правильно делать, но для каждого лейбла не хотелось создавать одну и ту же конструкцию
    func setupText() {
        let labelArray = [profileNameLabel, levelNameLabel]
        
        for label in labelArray {
            let attributedText = NSMutableAttributedString(string: label.text ?? "",
                                                                attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)
                                                               ])
            label.attributedText = attributedText
        }
    }
    
    @objc func saveSettings() {
        UserDefaults.standard.set(userNameTextField.text, forKey: UserDefaultsKeys.name)
        UserDefaults.standard.set(levelSegmentedControl.selectedSegmentIndex, forKey: UserDefaultsKeys.level)
        navigationController?.popViewController(animated: true)
    }
}


