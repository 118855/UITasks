//
//  ViewController.swift
//  Picker
//
//  Created by admin on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet private weak var genderTextField: UITextField!
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var pickerView = UIPickerView()
    private var datePicker = UIDatePicker()
    
    private let genders = [ "Female", "Male", "Unknown" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView()
        setImage()
        setView()
    }
    
    func setImage() {
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.contentMode = .scaleAspectFit
    }
   
    //DatePicker
    func datePickerView() {
            dateTextField.inputView = datePicker
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.maximumDate = Calendar.current.date(byAdding: .day, value: 0 , to: Date())
            datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        }

    @objc private func dateChanged() {
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .medium
            dateTextField.text = "Date of birth: " + dateFormat.string(from: datePicker.date)
        }
    }
    
    //GenderPicker
extension ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setView () {
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTextField.inputView = pickerView
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row]
        genderTextField.resignFirstResponder()
    }
}

