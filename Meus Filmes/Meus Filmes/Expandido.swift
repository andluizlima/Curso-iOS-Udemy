//
//  Expandido.swift
//  Meus Filmes
//
//  Created by Andre Luiz Rodrigues on 25/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class Expandido: UIViewController {
    
    var filme: Filme!
    
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var descricao: UILabel!
    @IBOutlet var titulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagem.image = filme.imagem
        titulo.text = filme.titulo
        descricao.text = filme.descricao
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

