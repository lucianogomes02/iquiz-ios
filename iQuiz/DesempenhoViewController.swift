//
//  DesempenhoViewController.swift
//  iQuiz
//
//  Created by Luciano Gomes on 07/08/23.
//

import UIKit

class DesempenhoViewController: UIViewController {
    var pontuacao: Int?

    @IBOutlet weak var resultadoQuiz: UILabel!
    
    @IBOutlet weak var percentualDeAcertos: UILabel!
    
    @IBOutlet weak var botaoReiniciarQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configurarLayout()
        configurarDesempenho()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        botaoReiniciarQuiz.layer.cornerRadius = 12.0
    }
    
    func configurarDesempenho() {
        guard let pontuacao = pontuacao else {return}
        resultadoQuiz.text = "Você acertou \(pontuacao) de \(questoes.count) questões."
        let percentual  = (pontuacao * 100) / questoes.count
        percentualDeAcertos.text = "Percentual final: \(percentual)%"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
