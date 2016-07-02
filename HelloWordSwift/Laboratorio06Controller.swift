//
//  Laboratorio06Controller.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 6/11/16.
//  Copyright © 2016 Fabricio Nogueira. All rights reserved.
//

import UIKit

class Laboratorio06Controller: UIViewController {
    
    @IBOutlet weak var nomeTextField : UITextField!;
    @IBOutlet weak var pesoTextField : UITextField!;
    @IBOutlet weak var alturaTextField : UITextField!;
    @IBOutlet weak var masculinoSwitch : UISwitch!;
    @IBOutlet weak var femininoSwitch : UISwitch!;
    
    func showMessage(msg : String){
        let janela : UIAlertController;
        let botaoOk : UIAlertAction;
        let botaoCancelar : UIAlertAction;
        
        janela = UIAlertController(
            title: "Resultado",
            message: msg,
            preferredStyle: UIAlertControllerStyle.ActionSheet
        );
        
        botaoOk = UIAlertAction(
            title : "Ok",
            style : UIAlertActionStyle.Default,
            handler : {
                (ACTION:UIAlertAction!) in self.limparTela();
            }
        );
        
        botaoCancelar = UIAlertAction(
            title : "Cancelar",
            style : UIAlertActionStyle.Cancel,
            handler : nil
        );
        
        janela.addAction(botaoOk);
        janela.addAction(botaoCancelar);
        
        presentViewController(janela, animated: true, completion: nil);
    }
    
    @IBAction func calcularPeso(){
        let nome : String = nomeTextField.text!;
        let altura : Float = (alturaTextField.text! as NSString).floatValue;
        let peso : Float = (pesoTextField.text! as NSString).floatValue;
        var pesoIdeal : Float = 0.0;
        
        if(!masculinoSwitch.on && !femininoSwitch.on){
            showMessage("Favor escolher o sexo!");
            return;
        }

        if(masculinoSwitch.on){
            pesoIdeal = peso / pow(altura,2);
        }else if(femininoSwitch.on){
            pesoIdeal = peso / pow(altura, 2);
        }
        print(pesoIdeal);
        
        if(pesoIdeal < 17){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está muito abaixo do peso.");
        }else if(pesoIdeal >= 17 && pesoIdeal <= 18.49){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está abaixo do peso.");
        }else if(pesoIdeal >= 18.5 && pesoIdeal <= 24.99){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está no peso normal.");
        }else if(pesoIdeal >= 25 && pesoIdeal <= 29.99){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está acima do peso ideal.");
        }else if(pesoIdeal >= 30 && pesoIdeal <= 34.99){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está com obesidade I.");
        }else if(pesoIdeal >= 35 && pesoIdeal <= 39.99){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está com obesidade II (Severa).");
        }else if(pesoIdeal > 40){
            showMessage("\(nome)\nÍndice: \(pesoIdeal)\nVocê está com obesidade III (Morbida).");
        }
    }
    
    @IBAction func clickSwitch(){
        fecharTeclado();
    }
    
    @IBAction func stateChanged(switchState : UISwitch){
        if(switchState.tag == 0){
            femininoSwitch.setOn(false, animated: true);
        }else{
            masculinoSwitch.setOn(false, animated: true);
        }
    }
    
    func fecharTeclado(){
        view.endEditing(true);
    }
    
    func limparTela(){
        nomeTextField.text = "";
        pesoTextField.text = "";
        alturaTextField.text = "";
        masculinoSwitch.setOn(false, animated: true);
        femininoSwitch.setOn(false, animated: true);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var tap : UIGestureRecognizer;
        tap = UITapGestureRecognizer(target: self, action: #selector(Laboratorio06Controller.fecharTeclado));
        view.addGestureRecognizer(tap);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
