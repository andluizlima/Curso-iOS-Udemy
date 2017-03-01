//
//  ViewController.swift
//  Alerta
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Função do botão que solicita o aperta
    @IBAction func abrirAlerta(_ sender: Any) {
        
        //Cria o alerta em si, definindo o título, mensagem e o estilo (.alert ou .actionSheet)
        let alertaController = UIAlertController(title: "Confirmar pizza", message: "Tem certeza que deseja pedir essa pizza?", preferredStyle: .actionSheet )
        
        //Cria os botões com o título, estilo (.default, .cancel ou .destructive) e a ação que o botão fará
        let confirmar = UIAlertAction(title: "Confirmar", style: .default , handler: nil)
        let cancelar = UIAlertAction(title: "Não quero :/", style: .destructive , handler: nil)
        
        //Adiciona os botões ao alerta a partir de um método no próprio alerta
        alertaController.addAction(confirmar)
        alertaController.addAction(cancelar)
        
        //Mostra o alerta tal, se será com animação e o que fazer assim que algo for clicado no alerta
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

