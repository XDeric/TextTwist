//
//  ViewController.swift
//  TextTwist
//
//  Created by EricM on 8/5/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var word3: UITextView!
    @IBOutlet weak var word4: UITextView!
    @IBOutlet weak var word5: UITextView!
    @IBOutlet weak var word6: UITextView!
    var count = 0
    
    @IBAction func textInput(_ sender: UITextField) {
    }

    
    
    override func viewDidLoad() {
        letter.text = WordData.allInfo[count].letters
        
        super.viewDidLoad()
        input.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 3{
            word3.text += "\(textField.text!)\n"
            return true
        }
        else if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 4{
            word4.text += "\(textField.text!)\n"
            return true
        }
        else if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 5{
            word5.text += "\(textField.text!)\n"
            return true
        }
        else if WordData.allInfo[count].words.contains(textField.text!) && textField.text!.count == 6{
            word6.text += "\(textField.text!)\n"
        return true
        }
        else {
            message.text = "Wrong Word!"
             return true
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let characterSetNotAllowed = CharacterSet.punctuationCharacters
        //let characterSetNotAllowed2 = CharacterSet(charactersIn: WordData.allInfo[count].letters)
        
        for i in letter.text!{
            if textField.text!.contains(String(i)){
                let char = letter.text!.firstIndex(of: i)
                letter.text!.remove(at: char!)
            }
            else{
//                message.text = "do nothing"
            }
        }
        
        if let _ = string.rangeOfCharacter(from: characterSetNotAllowed, options: .caseInsensitive) {
                message.text = "Invalid letter"
            return false
        } else {
            message.text = ""
            return true
        }
    }
        
    
}

