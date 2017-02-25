//
//  ResultadoViewController.swift
//  CaraOuCoroa
//
//  Created by Andre Luiz Rodrigues on 24/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class ResultadoViewController: UIViewController {
    
    @IBOutlet var imagemResultado: UIImageView!
    let resultados: [UIImage] = [UIImage(named: "moeda_cara.png")!, UIImage(named: "moeda_coroa.png")!]
    var resultado: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagemResultado.image = resultados[resultado]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
