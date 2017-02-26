//
//  ViewController.swift
//  Signos
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let signos: [String] = ["Áries", "Touro", "Gêmeos", "Câncer", "Leão", "Virgem", "Libra", "Escorpião", "Sagitário", "Capricórnio", "Aquário", "Peixes"]
    var descricao: [String] = ["De boas", "O melhor", "De boas", "De boas", "De boas", "De boas", "De boas", "Cuzão", "De boas", "De boas", "De boas", "De boas"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de itens que tem dentro de cada sessão
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    //Monta as linhas dentro da tabela
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nomeTemplate = "templateCell"
        //indexPath identifica em que linha está sendo feito o processamento
        let celula = tableView.dequeueReusableCell(withIdentifier: nomeTemplate, for: indexPath)
        celula.textLabel?.text = signos [ indexPath.row ]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertaController = UIAlertController(title: signos[indexPath.row], message: descricao[indexPath.row], preferredStyle: .alert )
        
        let confirmar = UIAlertAction(title: "Acertou rs", style: .default , handler: nil)
        
        alertaController.addAction(confirmar)
        
        present(alertaController, animated: true, completion: nil)
    }

}

