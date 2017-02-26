//
//  ViewController.swift
//  Meus Filmes
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes: [Filme] = [Filme(titulo: "O Exterminalmoço Do Futuro", imagem: #imageLiteral(resourceName: "filme0"),descricao: "Esse é bom demais")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaModelo", for: indexPath) as! CelulaFilme
        
        celula.titulo.text = filmes[indexPath.row].titulo
        celula.descricao.text = filmes[indexPath.row].descricao
        celula.imagem.image = filmes[indexPath.row].imagem
        
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "passaFilme"){
            let atual = tableView.indexPathForSelectedRow?.row
            let viewControllerDestino = segue.destination as! Expandido
            viewControllerDestino.filme = filmes[atual!]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

