//
//  TabelaControle.swift
//  HelloWordSwift
//
//  Created by Fabricio Nogueira dos Santos on 6/25/16.
//  Copyright © 2016 Fabricio Nogueira. All rights reserved.
//

import Foundation
import UIKit

class TabelaControle : UITableViewController{
    
//    let URL : String = "http://localhost:3000/";
    let URL : String = "http://192.168.5.237:8080/ServerJson/paises.json";
    var tabelaDados : Array<String> = Array<String>();
    
    func carregarDadosUrl(url:String){
        
            let httpMethod = "GET";
            let timeout = 15;
            let url = NSURL(string : url);
            let urlRequest = NSMutableURLRequest(
                URL: url!,
                cachePolicy : .ReloadIgnoringLocalAndRemoteCacheData,
                timeoutInterval: 15.0
            );
            let queue = NSOperationQueue();
        
            NSURLConnection.sendAsynchronousRequest(
                urlRequest,
                queue: queue,
                completionHandler: {(
                    response:NSURLResponse?,
                    data: NSData?,
                    error: NSError?) in
                        if data?.length > 0 && error == nil {
                            self.extrairJson(data!);
                        }else if data?.length == 0 && error == nil {
                            print("Não existe conteúdo para download.");
                        }else if error != nil{
                             print("Error: \(error)");
                        }
                    }
            )
            
        
    }
    
    func extrairJson(jsonData : NSData){
        do{
            let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []);
            if let listaPaises = json as? NSArray{
                for (var i = 0; i < listaPaises.count ; i += 1) {
                    if let objetoPais = listaPaises[i] as? NSDictionary {
                        if let nome = objetoPais["nome"] as? String{
                            if let codigo = objetoPais["codigo"] as? String{
                                tabelaDados.append(nome + " [" + codigo + "]");
                            }
                        }
                    }
                }
            }
            atualizarTabela();
        }catch let error{
            print("JSON Serialization failed. Error: \(error)")
        }
    }
    
    func atualizarTabela(){
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData();
            return;
        });
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        print("Iniciado");
        carregarDadosUrl(URL);
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celula" , forIndexPath: indexPath) ;
        cell.textLabel?.text = tabelaDados[indexPath.row];
        return cell;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabelaDados.count;
    }
    
}