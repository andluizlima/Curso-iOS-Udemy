//
//  ViewController.swift
//  CaraOuCoroa
//
//  Created by Andre Luiz Rodrigues on 24/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "passaResultado"){
            let viewResultado = segue.destination as! ResultadoViewController
            viewResultado.resultado = Int(arc4random_uniform(2))
        }
    }
}

