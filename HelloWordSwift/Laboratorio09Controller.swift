//
//  Laboratorio09Controller.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 6/11/16.
//  Copyright © 2016 Fabricio Nogueira. All rights reserved.
//

import UIKit

class Laboratorio09Controller: UIViewController {

    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var animarSwitch: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func animate(){
//        let lsImages = [
//          UIImage(named: "pet_bird.png")!,
//          UIImage(named: "pet_cat.png")!,
//          UIImage(named: "pet_dog.png")!,
//          UIImage(named: "pet_fish.png")!,
//          UIImage(named: "pet_turtle.png")!
//        ];
        
        let lsImages = [
            UIImage(named: "1.png")!,
            UIImage(named: "2.png")!,
            UIImage(named: "3.png")!,
            UIImage(named: "4.png")!
        ];
        
        imageView.animationImages = lsImages;
        imageView.animationDuration = 0.9;
        if(animarSwitch.on){
            imageView.startAnimating();
            labelInfo.text = "Parar animação";
        }else{
            labelInfo.text = "Iniciar animação";
            imageView.stopAnimating();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
