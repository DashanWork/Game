//
//  Game3SingleView.swift
//  kynative
//
//  Created by JACK on 2018/11/21.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

protocol Game3SingViewDelegate: NSObjectProtocol {
    func change(num: Int, viewNum: Int)
}

class Game3SingleView: UIView {
    var label: UILabel?
    var text: UITextField?
    var num: Int?
    var viewNum: Int?
    weak var delegate: Game3SingViewDelegate?
    
    func setGame(num: Int, viewNum: Int){
        self.backgroundColor = UIColor.clear
        self.num = num
        self.viewNum = viewNum
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        if self.num == 0{
            self.text = UITextField.init(frame: self.bounds)
            self.text?.delegate = self
            self.addSubview(self.text!)
            self.text?.isHidden = false
            self.text?.keyboardType = .numberPad
            self.label?.isHidden = true
            self.text?.textAlignment = .center
            self.text?.backgroundColor = UIColor.clear
        }else{
            self.label = UILabel.init(frame: self.bounds)
            self.label?.textAlignment = .center
            self.label?.text = "\(self.num!)"
            self.label?.textColor = UIColor.white
            self.label?.backgroundColor = UIColor.gray
            self.addSubview(self.label!)
            self.text?.isHidden = true
            self.label?.isHidden = false
        }
    }
    
}

extension Game3SingleView: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == ""{
            textField.text = ""
            self.num = 0
            self.delegate?.change(num: self.num!, viewNum: self.viewNum!)
            print("\(self.num!)")
            return false
        }
        if textField.text?.length >= 1{
            let str = textField.text!
            textField.text = (str as NSString).substring(to: 1)
            self.num = textField.text?.intValue
            self.delegate?.change(num: self.num!, viewNum: self.viewNum!)
            print("\(self.num!)")
            return false
        }else{
            let str = (string as NSString).substring(to: 1)
            textField.text = str
            self.num = str.intValue
            self.delegate?.change(num: self.num!, viewNum: self.viewNum!)
            print("\(self.num!)")
            return false
        }
        
    }
    
    
    
}
