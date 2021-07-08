//
//  ViewController.swift
//  RGB
//
//  Created by admin on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var redLabel: UILabel!
    @IBOutlet private weak var redTextField: UITextField!
   
    @IBOutlet private weak var greenLabel: UILabel!
    @IBOutlet private weak var greenTextField: UITextField!
    
    @IBOutlet private weak var blueLabel: UILabel!
    @IBOutlet private weak var blueTextField: UITextField!
    
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    @IBOutlet private weak var viewComponent: UIView!
    
    @IBAction func setColor(_ sender: Any) {
       changeColor()
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    func changeColor() {
        let red = CGFloat(redSlider.value)
        let blue = CGFloat(blueSlider.value)
        let green = CGFloat(greenSlider.value)
        
        redTextField.text = String(Int(redSlider.value))
        greenTextField.text = String(Int(greenSlider.value))
        blueTextField.text = String(Int(blueSlider.value))
        
        viewComponent.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
    
extension ViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text, let textValue = Float(text + string) else {
            return false
        }
        if textValue > 255 {
            return false
        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        redSlider.value = Float(redTextField.text ?? " ") ?? 0.0
        greenSlider.value = Float(greenTextField.text ?? " ") ?? 0.0
        blueSlider.value = Float(blueTextField.text ?? " ") ?? 0.0
        changeColor()
        textField.resignFirstResponder()
        return true
    }
}

