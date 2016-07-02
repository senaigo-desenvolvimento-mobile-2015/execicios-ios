//
//  Laboratorio07Controller.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 6/11/16.
//  Copyright © 2016 Fabricio Nogueira. All rights reserved.
//

import UIKit

class Laboratorio07Controller: UIViewController {

    
    @IBOutlet weak var celciusSlider: UISlider!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var celciusLabel: UILabel!
    
    
    @IBAction func converter(sender: AnyObject) {
        let celciusFloat : Float!;
        
        celciusFloat = celciusSlider.value;
        
        fahrenheitTextField.text = String(
            format: "%.2f", celciusToFahrenheit(celciusFloat)
        );
        
        celciusLabel?.text = String(
            format: "%.2f", celciusFloat
        );
        
    }
    
    func celciusToFahrenheit(c : Float) -> Float{
        return c * 1.8 + 32.0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
