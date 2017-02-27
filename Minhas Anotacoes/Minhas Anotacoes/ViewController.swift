//
//  ViewController.swift
//  Minhas Anotacoes
//
//  Created by Andre Luiz Rodrigues on 26/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var salvos: UITextView!
    @IBOutlet var textoDigitado: UITextView!
    var anotacoes: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        anotacoes = UserDefaults.standard.object(forKey: "notas") as! [String]!
        if(anotacoes == nil){
            anotacoes = []
        }
        salvos.text = ""
        for nota in anotacoes {
            salvos.text! += nota + "\n"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func salvar(_ sender: Any) {
        if(!(textoDigitado.text?.isEmpty)!){
            anotacoes.append(textoDigitado.text!)
            UserDefaults.standard.set(anotacoes, forKey: "notas")
            salvos.text! += textoDigitado.text! + "\n"
        }
    }
}

