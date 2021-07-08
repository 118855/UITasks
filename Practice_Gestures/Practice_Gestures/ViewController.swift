//
//  ViewController.swift
//  Practice_Gestures
//
//  Created by admin on 08.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var redView: UIView!
    
    @IBOutlet private var centerXconstaint: NSLayoutConstraint!
    @IBOutlet private var centerYconstaint: NSLayoutConstraint!
    @IBOutlet private var widthConstraint: NSLayoutConstraint!
    @IBOutlet private var heightConstraint: NSLayoutConstraint!
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private let pinchGestureRecognizer = UIPinchGestureRecognizer()
    private let rotateGestureRecognizer = UIRotationGestureRecognizer()
    private let singleTapGestureRecognizer = UITapGestureRecognizer()
    
    private var panGestureAnchorPoint: CGPoint?
    private var pinchGestureAnchorScale: CGFloat?
    private var rotateGestureAnchorRotation: CGFloat?
    
    private static let colorsOfView: [UIColor] = [.red, .green, .blue]
    
    private var scale: CGFloat = 1.0 { didSet { updateViewTransform() } }
    private var rotation: CGFloat = 0.0 { didSet { updateViewTransform() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        setupGestureRecognizers()
    }
    
    private func setupGestureRecognizers() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        pinchGestureRecognizer.addTarget(self, action: #selector(handlePinchGesture(_:)))
        rotateGestureRecognizer.addTarget(self, action: #selector(handleRotateGesture(_:)))
        singleTapGestureRecognizer.addTarget(self, action: #selector(handleSingleTapGesture(_:)))
        
        panGestureRecognizer.maximumNumberOfTouches = 1
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        
        [panGestureRecognizer,
         pinchGestureRecognizer,
         rotateGestureRecognizer,
         singleTapGestureRecognizer,
        ].forEach { $0.delegate = self }
        
        redView.addGestureRecognizer(panGestureRecognizer)
        redView.addGestureRecognizer(pinchGestureRecognizer)
        redView.addGestureRecognizer(rotateGestureRecognizer)
        redView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    private func updateViewTransform() {
        redView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale).rotated(by: rotation)
    }
    
    @objc private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer == gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
            
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
        
            centerXconstaint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYconstaint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
            
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
            
        case .failed, .possible:
            break
            
        default:
            break
        }
    }
    
    @objc private func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        guard pinchGestureRecognizer == gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            pinchGestureAnchorScale = gestureRecognizer.scale
            
        case .changed:
            guard let pinchGestureAnchorScale = pinchGestureAnchorScale else { return }
            
            let gestureScale = gestureRecognizer.scale
            scale += gestureScale - pinchGestureAnchorScale
            self.pinchGestureAnchorScale = gestureScale
            
        case .cancelled, .ended:
            pinchGestureAnchorScale = nil
            
        case .failed, .possible:
            break
            
        default:
            break
        }
    }
    
    @objc private func handleRotateGesture(_ gestureRecognizer: UIRotationGestureRecognizer) {
        guard rotateGestureRecognizer == gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            rotateGestureAnchorRotation = gestureRecognizer.rotation
            
        case .changed:
            guard let rotateGestureAnchorRotation = rotateGestureAnchorRotation else { return }
            
            let gestureRotation = gestureRecognizer.rotation
            rotation += gestureRotation - rotateGestureAnchorRotation
            self.rotateGestureAnchorRotation = gestureRotation
            
        case .cancelled, .ended:
            rotateGestureAnchorRotation = nil
            
        case .failed, .possible:
            break
            
        default:
            break
        }
    }
    
    @objc private func handleSingleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        
        guard singleTapGestureRecognizer == gestureRecognizer else { return }
       
        redView.backgroundColor = ViewController.colorsOfView.randomElement()
        
        scale = 1.0
        rotation = 0
        centerYconstaint.constant = 0
        centerXconstaint.constant = 0
    }
}
    extension ViewController: UIGestureRecognizerDelegate {
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                               shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            let simultaneousRecognizers = [panGestureRecognizer, pinchGestureRecognizer, rotateGestureRecognizer]
            return simultaneousRecognizers.contains(gestureRecognizer) &&
                simultaneousRecognizers.contains(otherGestureRecognizer)
        }
        
}

