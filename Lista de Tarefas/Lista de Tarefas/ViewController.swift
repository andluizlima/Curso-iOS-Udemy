//
//  ViewController.swift
//  Lista de Tarefas
//
//  Created by Andre Luiz Rodrigues on 27/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tarefas: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        carregaView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Define o número de sessões
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Define o numero de linhas por sessão
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    //Função que cria a célula de cada linha
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Cria a célula baseando-se na célula modelo criada na view com o identificador passado no parâmetro, junto ao índice definido automaticamente pelo indexPath
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaPadrao", for: indexPath)
        
        //Muda o texto principal primitivo da célula
        celula.textLabel?.text = tarefas[indexPath.row]
        
        //Retorna a célula à tabela
        return celula
    }
    
    //Quando algum botão que leva a alguma outra view é clicado, essa função é chamada
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Se a segue conectada entre esse botão e sua respectiva view tiver esse identificador
        if(segue.identifier == "criarTarefa"){
            
            //É feito um casting na view de destino dessa segue para a própria classe dela com o intuito de ter acesso aos seus dados e, assim, efetuar as mudanças ou pré-configurações necessárias
            //Nesse caso, passar a lista de tarefas
            (segue.destination as! TarefaViewController).tarefas = tarefas
        }
    }
    
    //Essa função é chamada toda vez em que essa view aparece na tela do usuário, menos na primeira
    override func viewDidAppear(_ animated: Bool) {
        carregaView()
    }
    
    //Função responsável pelos estilos de edição de cada célula (.none, .delete e .insert)
    //Sem ela os botões de edição não aparecem
    //Com ela os botões aparecem, mas sem a edição de cada um, não fazem nada
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
        //Aqui faz o tratamento para o botão de deletar
        if editingStyle == UITableViewCellEditingStyle.delete{
            TarefaUserDefaults().removeTarefa(i: indexPath.row)
            carregaView()
        }
    }
    
    func carregaView() {
        
        //Recarrega a lista de tarefas toda vez que a função é chamada
        tarefas = TarefaUserDefaults().listarTarefas()
        
        //Recarrega a tabela toda vez que a função é chamada
        tableView.reloadData()
    }
}

