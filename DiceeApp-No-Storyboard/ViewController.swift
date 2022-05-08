//
//  ViewController.swift
//  DiceeApp-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {
    
    private let topView: UIView = {
        let view = UIView()
        return view
    }()

    private let middleView: UIView = {
        let view = UIView()
        return view
    }()

    private let bottomView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [topView, middleView, bottomView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
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
    
    lazy var stackDice: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftDiceImageView, rightDiceImageView])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 65
        return stack
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

        view.addSubview(backgroundImageView)
        
        view.addSubview(stackView)
        topView.addSubview(logoImageView)
        middleView.addSubview(stackDice)
        bottomView.addSubview(rollButton)
        
       
        stackDice.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //Constraints for the background image
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            //Constraints for stackView
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),

            //Constraints for the logo image
            logoImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            //Constraints for stackDice
            stackDice.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            stackDice.centerYAnchor.constraint(equalTo: middleView.centerYAnchor),
            
            //Constraints for the roll button
            rollButton.widthAnchor.constraint(equalToConstant: 120),
            rollButton.heightAnchor.constraint(equalToConstant: 60),
            rollButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
     
        ])
        
    }

    @objc func rollButtonPressed() {
        leftDiceImageView.image = diceArray.randomElement() as? UIImage
        rightDiceImageView.image = diceArray.randomElement() as? UIImage
    }

}

