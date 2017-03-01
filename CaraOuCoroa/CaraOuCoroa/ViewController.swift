//
//  ViewController.swift
//  CaraOuCoroa
//
//  Created by Andre Luiz Rodrigues on 24/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Função para passar os dados dessa view para a outra
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Identificar a segue (aquela setinha de direcionamento) e para que view ela tá levando
        //Obs.: Um identificador deve ser determinado para a segue no storyboard
        if(segue.identifier == "passaResultado"){
            //Aqui no caso estamos criando um objeto para modificar os valores dela
            let viewResultado = segue.destination as! ResultadoViewController
            //Aqui estamos modificando um argumento da view em questão
            viewResultado.resultado = Int(arc4random_uniform(2))
        }
    }
}

