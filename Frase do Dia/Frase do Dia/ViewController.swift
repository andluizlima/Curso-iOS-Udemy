//
//  ViewController.swift
//  Frase do Dia
//
//  Created by Andre Luiz Rodrigues on 11/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let frases = ["Bring your daughter", "To the slaughter", "Let her go"]

    @IBOutlet var frase: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gerar(_ sender: Any) {
        var n = arc4random_uniform(UInt32(frases.count))
        frase.text = frases[Int(n)]
    }

}

