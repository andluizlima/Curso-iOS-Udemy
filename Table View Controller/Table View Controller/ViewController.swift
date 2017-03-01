//
//  ViewController.swift
//  Table View Controller
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dados: [String] = ["Lasanha", "Pizza", "Torta"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Número de sessões que contém na tabela dessa view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de itens que tem dentro de cada sessão
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    //Monta as linhas dentro da tabela
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nomeTemplate = "templateCell"
        //indexPath identifica em que linha está sendo feito o processamento
        let celula = tableView.dequeueReusableCell(withIdentifier: nomeTemplate, for: indexPath)
        celula.textLabel?.text = dados[ indexPath.row ]
        
        return celula
    }
    
}

