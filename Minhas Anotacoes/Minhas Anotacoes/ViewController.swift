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
        
        //Carrega as anotações já salvas na memória de padrões do usuário
        anotacoes = UserDefaults.standard.object(forKey: "notas") as! [String]!
        if(anotacoes == nil){
            anotacoes = []
        }
        for nota in anotacoes {
            salvos.text! += nota + "\n"
        }
    }
    
    //Função para esconder o teclado quando o usuário clicar em algum lugar da tela (que não seja o teclado)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func salvar(_ sender: Any) {
        if(!(textoDigitado.text?.isEmpty)!){
            anotacoes.append(textoDigitado.text!)
            UserDefaults.standard.set(anotacoes, forKey: "notas")
            salvos.text! += textoDigitado.text! + "\n"
            textoDigitado.text = ""
        }
    }
}

