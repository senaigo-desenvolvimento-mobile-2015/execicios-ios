//
//  Exercicio05Controller.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 6/25/16.
//  Copyright © 2016 Fabricio Nogueira. All rights reserved.
//

import UIKit
import CoreData

class Exercicio05Controller: UIViewController, UITableViewDataSource {
    
    var pessoas = [NSManagedObject]();
    
    @IBOutlet weak var tableView: UITableView!;
    
    @IBAction func addName(sender: AnyObject){
        
        let alert = UIAlertController(
            title: "Novo nome",
            message: "Adicionar novo nome",
            preferredStyle: .Alert
        );
        
        let saveAction = UIAlertAction(
            title: "Salvar",
            style: .Default){
                (action: UIAlertAction!) -> Void in
                let textField = alert.textFields![0] as UITextField;
                self.saveName(textField.text!);
                self.tableView.reloadData();
        };

        let cancelAction = UIAlertAction(
            title: "Cancelar",
            style: .Default){(action: UIAlertAction!) -> Void in };
        
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField!) -> Void in
        };
        
        alert.addAction(saveAction);
        alert.addAction(cancelAction);

        presentViewController(alert, animated:true, completion:nil);
    
    }
    
    func saveName(nome : String){
        let ad = UIApplication.sharedApplication().delegate as! AppDelegate;
        let mc = ad.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Pessoa", inManagedObjectContext: mc);
        let pessoa = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: mc);
        
        pessoa.setValue(nome, forKey:"nome");
        
        do {
            try mc.save();
            pessoas.append(pessoa);
        } catch let error as NSError {
            print("Error: \(error.localizedDescription), \(error.userInfo)");
        }
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pessoas.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Celula")! as UITableViewCell;
        let pessoa = pessoas[indexPath.row];
        cell.textLabel!.text = pessoa.valueForKey("nome") as? String;
        return cell;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        do {
            let ad = UIApplication.sharedApplication().delegate as! AppDelegate;
            let mc = ad.managedObjectContext;
            let fetchRequest = NSFetchRequest(entityName: "Pessoa");
            let fetchResult = try mc.executeFetchRequest(fetchRequest);
            pessoas = fetchResult as! [NSManagedObject]
        }catch let error as NSError {
            print("Error: \(error.localizedDescription), \(error.userInfo)");
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
//        title = "Listagem";
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Celula");
        

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
