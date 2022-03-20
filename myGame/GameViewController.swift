//
//  GameViewController.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 21.11.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    private var levelImageName = ""
    private var backgroundImage = UIImageView()
    private var backgroundImage2 = UIImageView()
    
    private var obstacleImage1 = UIImageView(image: UIImage(named: "obstacle"))
 
    private let carImage = UIImageView(image: UIImage(named: "purpleCar"))
    private let closeGameButton = UIButton(type: .system)
    private var count = 0
    
    private var gameTimer: Timer?
    private var gameTimer2: Timer?
    
    lazy var minX = view.frame.minX
    lazy var midX = view.frame.midX - obstacleImage1.frame.size.height / 2
    lazy var maxX = view.frame.maxX - obstacleImage1.frame.size.height
    private lazy var arrayX = [minX, midX, maxX]
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(generateAnimObstacle), userInfo: nil, repeats: true)
        gameTimer2 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(searchContact), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBackground()
        
    }

}

//MARK: - Extension

private extension GameViewController {
    
    func setupViews() {
        setupLevel()
        view.addSubviewsForAutoLayout([carImage, closeGameButton])
        view.addSubview(obstacleImage1)
        
        carImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            carImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0),
            carImage.widthAnchor.constraint(equalToConstant: view.bounds.maxX / 3),
            carImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        obstacleImage1.contentMode = .scaleAspectFit
        obstacleImage1.frame.size = CGSize(width: 100, height: 100)
        obstacleImage1.frame.origin.x = view.bounds.minX - obstacleImage1.frame.size.height
        obstacleImage1.frame.origin.y = view.bounds.minY - obstacleImage1.frame.size.height
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeftRecognizer.direction = .left
        carImage.addGestureRecognizer(swipeLeftRecognizer)

        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRightRecognizer.direction = .right
        carImage.addGestureRecognizer(swipeRightRecognizer)

        carImage.isUserInteractionEnabled = true

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
    
    func setupLevel() {
        switch UserDefaults.standard.integer(forKey: UserDefaultsKeys.level) {
        case 0:
            levelImageName = "summerLevel"
        case 1:
            levelImageName = "spaceLevel"
        default:
            levelImageName = "snowLevel"
        }
        generateBackgroundImage()
    }
    
    func generateBackgroundImage() {
        backgroundImage = UIImageView(image: UIImage(named: levelImageName))
        backgroundImage2 = UIImageView(image: UIImage(named: levelImageName))
        
        view.addSubviewsForAutoLayout(backgroundImage)
        view.addSubviewsForAutoLayout(backgroundImage2)
        view.sendSubviewToBack(backgroundImage)
        view.sendSubviewToBack(backgroundImage2)

        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage2.contentMode = .scaleAspectFill

        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])

        NSLayoutConstraint.activate([
            backgroundImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage2.topAnchor.constraint(equalTo: view.topAnchor, constant: -view.frame.height),
            backgroundImage2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height),
        ])
        
        
    }
    
    @objc func closeGame() {
        view.layer.removeAllAnimations()
        cancelTimer()
        dismiss(animated: false, completion: nil)
        
    }
    
    func cancelTimer() {
        gameTimer?.invalidate()
        gameTimer = nil
        
        gameTimer2?.invalidate()
        gameTimer2 = nil
    }
    
    @objc func swipe(_ recognizer: UISwipeGestureRecognizer) {
        
        switch recognizer.direction {
        case .left:
            if carImage.frame.minX < view.bounds.minX {
                return
            } else {
                carImage.frame.origin.x -= view.frame.maxX / 3
            }
        case .right:
            if carImage.frame.maxX > view.bounds.maxX {
                return
            } else {
                carImage.frame.origin.x += view.frame.maxX / 3
            }
        default:
            break
            
        }
    }
    
    func removeAnimations() {
        self.backgroundImage.layer.removeAllAnimations()
        self.backgroundImage2.layer.removeAllAnimations()
        self.obstacleImage1.layer.removeAllAnimations()
        self.view.layer.removeAllAnimations()
    }
    
    func animateBackground() {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       options: [.repeat, .curveLinear], animations: {
            
            self.backgroundImage.frame = self.backgroundImage.frame.offsetBy(dx: 0.0, dy: +1 * self.backgroundImage.frame.size.height)
            
            self.backgroundImage2.frame = self.backgroundImage2.frame.offsetBy(dx: 0.0, dy: +1 * self.backgroundImage2.frame.size.height)
            
        }, completion: nil)
    }
    
    
    @objc func generateAnimObstacle() {
        
        obstacleImage1.frame.origin.y = view.bounds.minY - obstacleImage1.frame.size.height
        obstacleImage1.frame.origin.x = arrayX.randomElement() ?? midX

        goAnim(obtacle: obstacleImage1)
    }
    
    func goAnim(obtacle: UIImageView) {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       options: [.curveLinear]) {
            obtacle.frame = obtacle.frame.offsetBy(dx: 0.0, dy: +1 * (self.view.bounds.height + obtacle.frame.size.width))
        } completion: { _ in
            if obtacle.frame.maxY == self.view.frame.maxY + obtacle.frame.size.width {
                self.count += 1
                print(self.count)
            }
        }
    }
    
    @objc func searchContact() {
        if self.carImage.frame.intersects(self.obstacleImage1.layer.presentation()?.frame ?? CGRect()) {
            cancelTimer()
            removeAnimations()
            self.count -= 1
            print("ops")
        }
    }
    
}
