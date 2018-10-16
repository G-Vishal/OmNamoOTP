//
//  ViewController.swift
//  OmNamoPOST
//
//  Created by iOS Developer on 16/10/18.
//  Copyright © 2018 iOS Developer. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    let URL_OTP = "http://166.62.121.85:8015/api/OTP_OtpMatch"
    
    
    
    @IBOutlet weak var EnterOtp: UITextField!
    
    @IBOutlet weak var EnterMobile: UITextField!
    
    @IBOutlet weak var responseLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        responseLabel.isHidden = true
        EnterOtp.isHidden = true
        submitOtp.isHidden = true
        
    }

    @IBAction func OTPButtonPressed(_ sender: Any) {
        
        responseLabel.isHidden = false
        
        let parameters: Parameters=[
            "MOBILE_NUMBER":EnterMobile.text!]
        
        //sending http post req
        
        Alamofire.request(URL_OTP, method: .post, parameters: parameters).responseJSON {
                response in
                print(response)
            
            
            if let result = response.result.value{
                
                
                let jsoneData = result as! NSDictionary
                
                
                self.responseLabel.text = jsoneData.value(forKey: "ResponseMessage") as! String?
            }
            
        }
    }
    
    
    @IBAction func submitOtp(_ sender: Any) {
    
    
    
    }
    
}

