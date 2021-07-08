//
//  ViewController.swift
//  Practice_Autolayout2
//
//  Created by admin on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {

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
            redView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
            redView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8).isActive = true
            
            let greenView = UIView()
            greenView.backgroundColor = .green
            greenView.translatesAutoresizingMaskIntoConstraints = false
            redView.addSubview(greenView)
           
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.8).isActive = true
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 0.8).isActive = true
            
            let blueView = UIView()
            blueView.backgroundColor = .blue
            blueView.translatesAutoresizingMaskIntoConstraints = false
            greenView.addSubview(blueView)
            
            blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            blueView.widthAnchor.constraint(equalTo: greenView.widthAnchor, multiplier: 0.8).isActive = true
            blueView.heightAnchor.constraint(equalTo: greenView.heightAnchor, multiplier: 0.8).isActive = true
            
            let yellowView = UIView()
            yellowView.backgroundColor = .yellow
            yellowView.translatesAutoresizingMaskIntoConstraints = false
            blueView.addSubview(yellowView)
            
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            yellowView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 0.8).isActive = true
            yellowView.heightAnchor.constraint(equalTo: blueView.heightAnchor, multiplier: 0.8).isActive = true
    }
    
}

