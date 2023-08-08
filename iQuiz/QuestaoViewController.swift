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
    
    @IBAction func respostaBotao(_ resposta: UIButton) {
        verificarResposta(resposta)
        proximaQuestao()
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
    
    func verificarResposta(_ resposta: UIButton) {
        let respostaCorreta: Bool = questoes[numeroQuestao].respostaCorreta == resposta.tag
        
        if respostaCorreta {
            pontuacao += 1
            resposta.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
        } else {
            resposta.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
    }
    
    func proximaQuestao() {
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            finalizarQuiz()
        }
    }
    
    func finalizarQuiz() {
        performSegue(withIdentifier: "irParaDesempenhoDoQuiz", sender: nil)
    }
    
    @objc func configurarQuestao() {
        tituloQuestao.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas {
            let tituloRespostaBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloRespostaBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desempenhoVC = segue.destination as? DesempenhoViewController {
            desempenhoVC.pontuacao = pontuacao
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
