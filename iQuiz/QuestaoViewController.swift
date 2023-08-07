//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Luciano Gomes on 05/08/23.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao: Int = 0
    var numeroQuestao: Int = 0

    @IBOutlet weak var tituloQuestao: UILabel!
    
    @IBOutlet var botoesRespostas: [UIButton]!
    
    @IBAction func respostaBotao(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        tituloQuestao.numberOfLines = 0
        tituloQuestao.textAlignment = .center
        for botao in botoesRespostas {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    func configurarQuestao() {
        tituloQuestao.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas {
            let tituloRespostaBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloRespostaBotao, for: .normal)
        }
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
