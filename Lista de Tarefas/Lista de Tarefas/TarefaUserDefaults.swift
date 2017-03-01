//
//  TarefaUserDefaults.swift
//  Lista de Tarefas
//
//  Created by Andre Luiz Rodrigues on 27/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class TarefaUserDefaults{
    
    var tarefas: [String]!
    
    func salvarTarefa(tarefa: String) {
        
        //Carrega a lista de tarefas
        tarefas = listarTarefas()
        
        //Adiciona a nova tarefa à lista
        tarefas.append(tarefa)
        
        //Salva a lista completa na memória de padrões do usuário
        UserDefaults.standard.set(tarefas, forKey: "minhasTarefas")
    }
    
    func listarTarefas() -> [String] {
        
        //Carrega a lista da memória de padrões do celular do usuário, força o casting para um vetor de Strings e retorna
        return UserDefaults.standard.object(forKey: "minhasTarefas") as! [String]
    }
    
    func removeTarefa(i: Int) {
        
        //Carrega a lista de tarefas
        tarefas = listarTarefas()
        tarefas.remove(at: i)
        
        //Salva a lista completa na memória de padrões do usuário
        UserDefaults.standard.set(tarefas, forKey: "minhasTarefas")
    }
}
