//
//  Filme.swift
//  Meus Filmes
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class Filme {
    var titulo: String!
    var imagem: UIImage!
    var descricao: String!
    
    init(titulo: String, imagem: UIImage, descricao: String) {
        self.titulo = titulo
        self.imagem = imagem
        self.descricao = descricao
    }
}

