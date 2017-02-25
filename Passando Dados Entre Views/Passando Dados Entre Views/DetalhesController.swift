//
//  DetalhesController.swift
//  Passando Dados Entre Views
//
//  Created by Andre Luiz Rodrigues on 24/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class DetalhesController: UIViewController {
    var textoRecebido: String!
    
    @IBOutlet var campo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        campo.text = textoRecebido
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
