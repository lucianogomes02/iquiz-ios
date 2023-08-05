//
//  ViewController.swift
//  iQuiz
//
//  Created by Luciano Gomes on 03/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    @IBAction func botaoPressionado(_ sender: Any) {
        print("O botão foi pressionado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }
    
    func configuraLayout() {
        botaoIniciarQuiz.layer.cornerRadius = 12
    }


}

