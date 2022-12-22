//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textd: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Double(23)+Double(2)/Double(3))
        // Do any additional setup after loading the view.
    }
    var disp : String = "";
    var prob: String = "";
    @IBAction func b9(_ sender: UIButton) {
        
        //+ %2B
        // division %2F
    
        if(sender.currentTitle! == "x" ){ // not detecting
            
            prob += "*";
            
        }else if (sender.currentTitle! == "÷"){
     
            prob += "%2F"
            //to be chabged
            
        }else if(sender.currentTitle! == "."){
            if(prob.count == 0){
                prob += "0."
            }else{
            prob += "."
            }
        }else if(sender.currentTitle! == "+" ){
            prob += "%2B"
        }
        else if(sender.currentTitle! == "-" ){
            prob += "-"
        }else{
            prob += sender.currentTitle!;
        }
        disp = prob.replacingOccurrences(of: "%2F", with: "/")
        disp = disp.replacingOccurrences(of: "%2B", with: "+")
        textd.text = disp;
    }
   
    @IBAction func longpress(_ sender: UILongPressGestureRecognizer) {
        prob = ""
        disp = ""
        textd.text=prob;
    }

    @IBAction func clear(_ sender: UIButton) {
        if(prob.count != 0){
        prob.removeLast()
        disp.removeLast()
        textd.text = disp;}
    }

    //make historuiallllllllll
    
    @IBAction func equal(_ sender: UIButton) {
        let url1 = "https://api.mathjs.org/v4/?expr=";
        print(("\(url1)\(prob)"))
        prequest(urls: "\(url1)\(prob)")
        print("df")
        
            
    }
    
    
    func prequest(urls : String){
        if let url = URL(string : urls){
            
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url){(data, response , error) in
                if (error != nil){
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    self.printdata(str: dataString!)
                    
                }
             
            }
            
            task.resume()
            }
    }
    
    func printdata(str:String){
        DispatchQueue.main.async {
            self.textd.text = str
        }

    }

}

