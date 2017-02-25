//
//  ViewController.swift
//  IdadeDoCachorro
//
//  Created by Andre Luiz Rodrigues on 11/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var campoIdade: UITextField!
    @IBOutlet var resposta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func pegaIdade(_ sender: Any) {
        var idade = Int(campoIdade.text!)!
        idade *= 7
        resposta.text = "Seu cachorro tem " + String(idade) + " anos humanos!"
    }

}

