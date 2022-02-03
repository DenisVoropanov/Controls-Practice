//
//  ViewController.swift
//  Cifra
//
//  Created by Alexandra Popova on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonUI: UIButton!
    @IBOutlet weak var sliderUI: UISlider!
    
    @IBOutlet weak var textFieldUI: UITextField!
    @IBOutlet var switchesUI: [UISwitch]!
    var number = 128 {
        
        didSet{
            
            if number < 0 {
                number = 255
            } else if 255 < number {
number = 0
            }
            updateUI()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        rotateSwitches()
    }
    
    func rotateSwitches () {
        for `switch` in switchesUI {
            `switch`.layer.transform = CATransform3DMakeRotation(.pi/2, 0, 0, 1)
            
        }
        }
    
    func updateNumberFromSwitch(){
        var number = 0
        for `switch` in switchesUI{
            number += `switch`.isOn ? `switch`.tag : 0
        }
        self.number = ( number % 256 )
    }
    
    func updateSwitches(){
        for `switch` in switchesUI {
            `switch`.isOn = Int(number) & `switch`.tag != 0
        }
        
    }
    
    
    func updateUI(){
        buttonUI.setTitle("\(number)", for: [])
        sliderUI.value = Float(number)
        textFieldUI.text = "\(number)"
        updateSwitches()
    }

    @IBAction func textChange(_ sender: UITextField) {
        number = Int(textFieldUI.text ?? "") ?? 0

    }
    @IBAction func sliderMove(_ sender: UISlider) {
        number = Int(sliderUI.value)
    }
    @IBAction func switchChanges(_ sender: UISwitch) {
        updateNumberFromSwitch()
        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        number += 1
    }
    @IBAction func tapGestureUI(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if location.x < view.bounds.midX {
            number -= 1
        } else {
            number += 1
        }
        
    }
}

