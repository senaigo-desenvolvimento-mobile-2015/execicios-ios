//
//  Exercicio02Controller.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 6/11/16.
//  Copyright © 2016 Fabricio Nogueira. All rights reserved.
//

import UIKit

class Exercicio02Controller: UIViewController {
    
    @IBOutlet weak var myButton01 : UIButton!;
    @IBOutlet weak var myButton02 : UIButton!;
    @IBOutlet weak var myTextField : UITextField!;
    
    @IBAction func actionButton(sender : UIButton){
        let textButton : String = sender.titleForState(UIControlState.Normal)!;
        let msg : String = "\(textButton), foi clicado";
        myTextField.text = msg;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();    
    }
    
    
}