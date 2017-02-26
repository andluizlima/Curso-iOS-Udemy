//
//  ViewController.swift
//  Alerta
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func abrirAlerta(_ sender: Any) {
        let alertaController = UIAlertController(title: "Confirmar pizza", message: "Tem certeza que deseja pedir essa pizza?", preferredStyle: .actionSheet )
        
        let confirmar = UIAlertAction(title: "Confirmar", style: .default , handler: nil)
        let cancelar = UIAlertAction(title: "Não quero :/", style: .destructive , handler: nil)
        
        alertaController.addAction(confirmar)
        alertaController.addAction(cancelar)
        
        present(alertaController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

