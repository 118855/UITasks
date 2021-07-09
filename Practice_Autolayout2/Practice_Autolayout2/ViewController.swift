//
//  ViewController.swift
//  Practice_Autolayout2
//
//  Created by admin on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let multiplier: CGFloat = 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI() {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        redView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier).isActive = true
        redView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: multiplier).isActive = true
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(greenView)
        
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: multiplier).isActive = true
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: multiplier).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        greenView.addSubview(blueView)
        
        blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blueView.widthAnchor.constraint(equalTo: greenView.widthAnchor, multiplier: multiplier).isActive = true
        blueView.heightAnchor.constraint(equalTo: greenView.heightAnchor, multiplier: multiplier).isActive = true
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        blueView.addSubview(yellowView)
        
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: multiplier).isActive = true
        yellowView.heightAnchor.constraint(equalTo: blueView.heightAnchor, multiplier: multiplier).isActive = true
    }
}

