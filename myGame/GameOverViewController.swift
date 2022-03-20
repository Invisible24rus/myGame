//
//  GameOverViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 20.03.2022.
//

import UIKit

class GameOverViewController: UIViewController {
    
    private let gameOverLabel: UILabel = {
        let label = UILabel()
        label.text = "Конец игры"
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
    
    private let closeGameButton = UIButton(type: .system)
    
    var count = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        

    }
}

//MARK: - Extension

private extension GameOverViewController {
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubviewsForAutoLayout([gameOverLabel, gameScoreLabel, closeGameButton])
        
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameOverLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        ])
        
        gameScoreLabel.text = "Ваш счет \(count)"
        
        NSLayoutConstraint.activate([
            gameScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameScoreLabel.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor, constant: 50),
        ])
        
        closeGameButton.setTitle("X", for: .normal)
        closeGameButton.setTitleColor(.white, for: .normal)
        closeGameButton.backgroundColor = .systemBlue
        closeGameButton.layer.cornerRadius = 15
        closeGameButton.addTarget(self, action: #selector(closeGame), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            closeGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            closeGameButton.widthAnchor.constraint(equalToConstant: 30),
            closeGameButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    @objc func closeGame() {
        let someVC = MainViewController()
        someVC.modalPresentationStyle = .fullScreen
        present(someVC, animated: false, completion: nil)
        
        
    }
}
