//
//  ViewController.swift
//  Passando Dados Entre Views
//
//  Created by Andre Luiz Rodrigues on 23/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var texto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "enviarDadosDetalhes"){
            let viewControllerDestino = segue.destination as! DetalhesController
            viewControllerDestino.textoRecebido = texto.text
        }
    }

}

