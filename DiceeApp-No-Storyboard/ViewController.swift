//
//  ViewController.swift
//  DiceeApp-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {
    

    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceeLogo")
        return imageView
    }()
    
    private let leftDiceImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceOne")
        return imageView
    }()
    
    private let rightDiceImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceOne")
        return imageView
    }()
    
    private lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 0.60, green: 0.13, blue: 0.14, alpha: 1.00)
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let diceArray: [UIImage?] = [UIImage(named: "DiceOne"),UIImage(named: "DiceTwo"),UIImage(named: "DiceThree"),UIImage(named: "DiceFour"),UIImage(named: "DiceFive"),UIImage(named: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(leftDiceImageView)
        view.addSubview(rightDiceImageView)
        view.addSubview(rollButton)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        leftDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        rightDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //Constraints for the background image
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            //Constraints for the logo image
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Constraints for the left dice
            leftDiceImageView.widthAnchor.constraint(equalToConstant: 120),
            leftDiceImageView.heightAnchor.constraint(equalToConstant: 120),
            leftDiceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftDiceImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            
            //Constraints for the right dice
            rightDiceImageView.widthAnchor.constraint(equalToConstant: 120),
            rightDiceImageView.heightAnchor.constraint(equalToConstant: 120),
            rightDiceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightDiceImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            //Constraints for the roll button
            rollButton.widthAnchor.constraint(equalToConstant: 120),
            rollButton.heightAnchor.constraint(equalToConstant: 60),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
     
        ])
        
    }

    
    @objc func rollButtonPressed() {
        leftDiceImageView.image = diceArray.randomElement() as? UIImage
        rightDiceImageView.image = diceArray.randomElement() as? UIImage
    }

}

