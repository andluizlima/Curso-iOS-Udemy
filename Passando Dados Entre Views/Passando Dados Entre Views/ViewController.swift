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
    
    
    //Essa é a função que vai modificar os dados da view a qual o usuário está sendo direcionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Aqui a outra view está sendo identificada a partir do identificador da segue estipulado no storyboard
        if(segue.identifier == "enviarDadosDetalhes"){
            //Criando um objeto para modificar os dados da view identificada
            let viewControllerDestino = segue.destination as! DetalhesController
            //Modificando os dados, nesse caso, o atributo String "textoRecebido"
            viewControllerDestino.textoRecebido = texto.text
        }
    }

}

