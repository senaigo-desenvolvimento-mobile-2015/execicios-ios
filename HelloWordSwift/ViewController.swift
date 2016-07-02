//
//  ViewController.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 9/23/15.
//  Copyright © 2015 Fabricio Nogueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showMessage(){
        let janela = UIAlertController(
            title: "Mensagem",
            message: "Desenvolvedor IOS",
            preferredStyle: UIAlertControllerStyle.Alert
        );
        
        janela.addAction(UIAlertAction(
            title: "Ok",
            style: UIAlertActionStyle.Default,
            handler: nil));
        
        presentViewController(janela, animated: true, completion: nil);
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        var texto: NSString;
//        let numero: NSInteger = Int(arc4random_uniform(100));
//                
//        if(numero >= 10){
//            texto = "Verdadeiro";
//        }else{
//            texto = "false";
//            
//        }
//
//        print(texto);
//        
//        print(numero);
//    
//    }
//    
//    func msg(){
//        print("Chamou!");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

