//
//  GameViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    private var levelImageName = "snowLevel"
    private let closeGameButton = UIButton(type: .system)


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }

}

//MARK: - Extension

private extension GameViewController {
    
    func setupViews() {
        setupLevel()
        view.addSubviewsForAutoLayout(closeGameButton)
//        Сделал пока что кнопку заглушку, которая выходит с игры. Не успеваю уже доделать полностью c машинкой и препядствиями, но я обязательно догоню остальных) Только сегодня с нуля делал для домашнего задания весь проект.
        closeGameButton.setTitle("Выход", for: .normal)
        closeGameButton.setTitleColor(.white, for: .normal)
        closeGameButton.backgroundColor = .systemBlue
        closeGameButton.layer.cornerRadius = 20
        closeGameButton.addTarget(self, action: #selector(closeGame), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            closeGameButton.widthAnchor.constraint(equalToConstant: 120),
            closeGameButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
//    Придумал только вот такой вариант, как можно сделать генерацию "трассы" по выбранным настройкам, надеюсь покажешь более лучший вариант. По дефолту выставил у levelImageName - snowLevel, для того, чтобы если игрок не заходит в настройки, у него уже была какая то трасса. Потом зимний вариант также включу в селектед, чтобы можно было к ней вернуться всегда.
    func setupLevel() {
        switch UserDefaults.standard.integer(forKey: UserDefaultsKeys.level) {
        case 0:
            levelImageName = "spaceLevel"
        case 1:
            levelImageName = "summerLevel"
        default:
            levelImageName = "snowLevel"
        }
        generateBackgroundImage()
    }
    
    func generateBackgroundImage() {
        let backgroundImage = UIImageView(image: UIImage(named: levelImageName))
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubviewsForAutoLayout(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func closeGame() {
        dismiss(animated: true, completion: nil)
    }
}
