//
//  GameOverViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 20.03.2022.
//

import UIKit

class GameOverViewController: UIViewController {
    
    private var userDefaults = UserSettings()
    
    private let gameOverLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("gameOver", comment: "")
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 64.0)
        return label
    }()
    
    private let gameScoreLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    private let closeGameButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Extension

private extension GameOverViewController {
    
    func setupViews() {
        
        if userDefaults.name == nil {
            userNameLabel.text = "No Name"
        } else {
            userNameLabel.text = userDefaults.name
        }
        
        if userDefaults.tableLeaders == nil {
            var userArray: [[String: Any]] = []
            let newUser = ["Name": userDefaults.name ?? "No Name", "Score": userDefaults.gameScore] as [String : Any]
            userArray.append(newUser)
            userDefaults.tableLeaders = userArray
        } else {
            let newUser = ["Name": userDefaults.name ?? "No Name", "Score": userDefaults.gameScore] as [String : Any]
            userDefaults.tableLeaders?.append(newUser)
            userDefaults.tableLeaders?.sort { (($0["Score"] as? Int ?? 0) > ($1["Score"] as? Int ?? 0)) }
            
            
//            let sortedByValueArray = userDefaults.tableLeaders?.sorted(by: {
//                if $0.value != $1.value { return $0.value > $1.value } else { return String(describing: $0.key) < String(describing: $1.key) } })
            
//            userDefaults.tableLeaders?.sort { ($0[userDefaults.name ?? "No name"] ?? 0) > ($1[userDefaults.name ?? "No name"] ?? 0) }
        }
        
        navigationItem.hidesBackButton = true
        
        view.backgroundColor = .white
        
        view.addSubviewsForAutoLayout([gameOverLabel, gameScoreLabel, closeGameButton, userNameLabel])
        
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameOverLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor, constant: 50),
        ])
        
//        gameScoreLabel.text = "Ваш счет \(userDefaults.gameScore)"
        gameScoreLabel.text = String(format: NSLocalizedString("yourScore", comment: ""), userDefaults.gameScore)
        
        NSLayoutConstraint.activate([
            gameScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameScoreLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
        ])
        
        closeGameButton.setTitle(NSLocalizedString("menu", comment: ""), for: .normal)
        closeGameButton.setTitleColor(.white, for: .normal)
        closeGameButton.backgroundColor = .systemBlue
        closeGameButton.layer.cornerRadius = 15
        closeGameButton.addTarget(self, action: #selector(closeGame), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeGameButton.topAnchor.constraint(equalTo: gameScoreLabel.bottomAnchor, constant: 100),
            closeGameButton.widthAnchor.constraint(equalToConstant: 120),
            closeGameButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func closeGame() {
        navigationController?.popToRootViewController(animated: true)
    }
}
