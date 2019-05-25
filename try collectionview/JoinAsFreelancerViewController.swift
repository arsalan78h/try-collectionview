//
//  JoinAsFreelancerViewController.swift
//  try collectionview
//
//  Created by Arsalan Hashemi on 5/25/19.
//  Copyright © 2019 ArSaLaNhashemi. All rights reserved.
//

import UIKit

class JoinAsFreelancerViewController: UIViewController {

    @IBOutlet weak var userFNameTextField: UITextField!
    @IBOutlet weak var userLNameTextField: UITextField!
    @IBOutlet weak var userPhoneNumTextField: UITextField!
    @IBOutlet weak var userMailTextField: UITextField!
    @IBOutlet weak var userNickNameTextField: UITextField!
    @IBOutlet weak var userPassWord: UITextField!
    @IBOutlet weak var userVerifyPassWord: UITextField!
    
    @IBOutlet weak var nextButt: UIButton!
    
    @IBOutlet weak var rulesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let attributedString = NSMutableAttributedString(string: "با عضویت و ساخت حساب در سایت، من تمام قوانین سایت و مقررات حریم خصوصی را می پذیرم")
                
                attributedString.addAttribute(.link, value: "https://www.karishe.com/tos/", range: NSRange(location: 37, length: 33))
                
                rulesTextView.attributedText = attributedString
                rulesTextView.textAlignment = .center
        }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
    
    
}


    
    
    


