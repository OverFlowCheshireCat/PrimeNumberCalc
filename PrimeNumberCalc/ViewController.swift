//
//  ViewController.swift
//  PrimeNumberCalc
//
//  Created by dit03 on 2019. 4. 11..
//  Copyright © 2019년 201730529. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberInput.delegate = self
    }
    
    @IBAction func checkButton(_ sender: Any) {
        var check = true
        if let number = Int(numberInput.text!) {
        
            if number == 0 || number == 1 {
                check = false
            }
            
            if check {
                var i = 2
                
                while i < number {
                    if number % i == 0 {
                        check = false
                    }
                    i += 1
                }
            }
            
            if check {
                resultLabel.text = String(number) + " 은 소수가 맞습니다."
            } else {
                if number == 0 {
                    resultLabel.text = "올바른 숫자를 입력하세요 !"
                } else {
                    resultLabel.text = String(number) + " 은 소수가 아닙니다."
                }
            }
        } else {
            resultLabel.text = "올바른 숫자를 입력하세요 !"
        }
        
        numberInput.text = ""
        numberInput.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numberInput.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

