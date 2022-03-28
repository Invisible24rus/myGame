//
//  ViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 16.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let backgroundImage = UIImageView(image: UIImage(named: "backgroundImage"))
    private let logoImage = UIImageView(image: UIImage(named: "Some Games"))
    private let startGameButton = UIButton(type: .system)
    private let settingButton = UIButton(type: .system)
    private let tableScoreButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dismiss(animated: false, completion: nil)
    }
}


//MARK: - Extension

private extension MainViewController {
    
    func setupViews() {
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubviewsForAutoLayout([backgroundImage,logoImage,startGameButton,settingButton, tableScoreButton])
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        logoImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
        
        startGameButton.setTitle(NSLocalizedString("newGame", comment: ""), for: .normal)
        startGameButton.setTitleColor(.white, for: .normal)
        startGameButton.backgroundColor = .systemBlue
        startGameButton.layer.cornerRadius = 20
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startGameButton.widthAnchor.constraint(equalToConstant: 120),
            startGameButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        settingButton.setTitle(NSLocalizedString("settings", comment: ""), for: .normal)
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.backgroundColor = .systemBlue
        settingButton.layer.cornerRadius = 20
        settingButton.addTarget(self, action: #selector(showSettingsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            settingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20),
            settingButton.widthAnchor.constraint(equalToConstant: 120),
            settingButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        tableScoreButton.setTitle(NSLocalizedString("tableScore", comment: ""), for: .normal)
        tableScoreButton.setTitleColor(.white, for: .normal)
        tableScoreButton.backgroundColor = .systemBlue
        tableScoreButton.layer.cornerRadius = 20
        tableScoreButton.addTarget(self, action: #selector(showScoreTableVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            tableScoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableScoreButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 20),
            tableScoreButton.widthAnchor.constraint(equalToConstant: 150),
            tableScoreButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func startGame() {
        let gameVC = GameViewController()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func showSettingsVC() {
        let settingsVC = SettingsViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc func showScoreTableVC() {
        let scoreTableVC = TableScoreViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(scoreTableVC, animated: true)
    }
}
