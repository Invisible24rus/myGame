//
//  SettingsViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let backgroundImage = UIImageView(image: UIImage(named: "backgroundImage2"))
    private let profileNameLabel = UILabel()
    private let levelNameLabel = UILabel()
    private let userNameTextField = UITextField()
    private let levelSegmentedControl = UISegmentedControl(items: [NSLocalizedString("summer", comment: ""), NSLocalizedString("space", comment: ""), NSLocalizedString("retro", comment: "")])
    private let userDefaults = UserSettings()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
        userNameTextField.delegate = self
    }
    
    @objc func tap() {
        view.endEditing(true)
    }
    
    @objc func saveSegment() {
        userDefaults.level = levelSegmentedControl.selectedSegmentIndex
    }
}

//MARK: - Extension

private extension SettingsViewController {
    
    func setupViews() {
         
        title = NSLocalizedString("settings", comment: "")
        
        backgroundImage.contentMode = .scaleAspectFill
        
        userNameTextField.returnKeyType = .done
        
        levelSegmentedControl.addTarget(self, action: #selector(saveSegment), for: .valueChanged)
        
        view.addSubviewsForAutoLayout([backgroundImage,profileNameLabel, userNameTextField, levelNameLabel, levelSegmentedControl])
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        profileNameLabel.text = NSLocalizedString("nameOfProfile", comment: "")
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        profileNameLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        ])
        
        userNameTextField.backgroundColor = .white
        userNameTextField.borderStyle = .line
        userNameTextField.text = userDefaults.name
        userNameTextField.placeholder = NSLocalizedString("enterYourName", comment: "")
        
        NSLayoutConstraint.activate([
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userNameTextField.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 10),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        levelNameLabel.text = NSLocalizedString("level", comment: "")
        levelNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        levelNameLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            levelNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            levelNameLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
        ])
        
        levelSegmentedControl.backgroundColor = .white
        levelSegmentedControl.selectedSegmentIndex = userDefaults.level
        
        NSLayoutConstraint.activate([
            levelSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            levelSegmentedControl.topAnchor.constraint(equalTo: levelNameLabel.bottomAnchor, constant: 10),

        ])
    }
}


extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        userDefaults.name = userNameTextField.text
        print("save name YEP")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tap()
        return false
    }
}


