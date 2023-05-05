//
//  ViewController.swift
//  PhotoGen
//
//  Created by Andrei-Nicolae Calutiu on 05.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemYellow,
        .systemCyan,
        .systemBrown,
        .systemBlue,
        .systemGreen,
        .systemPink,
        .systemPurple,
        .systemOrange
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action:#selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55)
    }
    
    func getRandomPhoto(){
        let urlStr = "https://picsum.photos/2160"
        let url = URL(string: urlStr)!
        guard let data = try? Data(contentsOf: url)
            else {return}
        imageView.image = UIImage(data: data)
    }
}

