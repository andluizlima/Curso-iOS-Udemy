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
    
    //Passos triviais para usar uma tabela
    
    //1. Sobrescrever a função que retorna o número de sessões da tabela usada nessa view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //2. Sobrescrever a função que retorna o número de linhas por sessão da tabela usada nessa view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    //3. Montar a célula de cada linha a partir do identificador do modelo de célula e a classe da célula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Cria um objeto da célula para facilitar a edição dos dados
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaModelo", for: indexPath) as! CelulaFilme
        
        celula.titulo.text = filmes[indexPath.row].titulo
        celula.descricao.text = filmes[indexPath.row].descricao
        celula.imagem.image = filmes[indexPath.row].imagem
        
        //Retorna a célula para a tabela
        return celula
    }
    
    //Passa os dados, nesse caso, do filme para a view do filme expandido
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Identifica a segue
        if(segue.identifier == "passaFilme"){
            
            //Pega o index da linha que o usuário clicou
            let atual = tableView.indexPathForSelectedRow?.row
            
            //Cria um objeto da view de destino para a edição dos dados fazendo um casting para ter acesso aos atributos
            let viewControllerDestino = segue.destination as! Expandido
            viewControllerDestino.filme = filmes[atual!]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

