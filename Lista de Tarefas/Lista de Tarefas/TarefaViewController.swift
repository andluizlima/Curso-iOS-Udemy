//
//  TarefaViewController.swift
//  Lista de Tarefas
//
//  Created by Andre Luiz Rodrigues on 27/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {
    
    var tarefas: [String]!

    @IBOutlet var tarefaDigitada: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        if(!(tarefaDigitada.text == nil)){
            TarefaUserDefaults().salvarTarefa(tarefa: tarefaDigitada.text!)
            tarefaDigitada.text = ""
        }
    }

}
