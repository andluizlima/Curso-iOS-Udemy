//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Andre Luiz Rodrigues on 12/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var alcool: UITextField!
    @IBOutlet var gasolina: UITextField!
    @IBOutlet var resposta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pegaPrecos(alcool: String, gasolina: String) -> String{
        if(alcool == "" || gasolina == ""){
            return "Preencha todos os campos"
        } else {
            //Conta baseada em algum artigo da internet. Se tá na internet é porque é verdade.
            if(Double(alcool)!/Double(gasolina)! >= 0.7){
                return "Melhor utilizar gasolina"
            } else {
                return "Melhor utilizar álcool"
            }
        }
    }

    @IBAction func calcula(_ sender: Any) {
        if(alcool.text == nil || gasolina.text == nil){
            resposta.text = "Preencha todos os campos"
        }else{
            resposta.text = pegaPrecos(alcool: alcool.text!, gasolina: gasolina.text!)
        }
    }
}

