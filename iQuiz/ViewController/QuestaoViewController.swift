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

    @IBOutlet weak var questao: UILabel!
    
    @IBOutlet var respostas: [UIButton]!
    
    @IBAction func respostaBotao(_ resposta: UIButton) {
        verificarResposta(resposta)
        proximaQuestao()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        questao.numberOfLines = 0
        questao.textAlignment = .center
        for botao in respostas {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    func verificarResposta(_ resposta: UIButton) {
        let respostaCorreta: Bool = questoes[numeroQuestao].respostaCorreta == resposta.tag
        
        if respostaCorreta {
            pontuacao += 1
            resposta.backgroundColor = UIColor.respostaCorreta
        } else {
            resposta.backgroundColor = UIColor.respostaErrada
        }
    }
    
    func configurarTempoEntreQuestoes(_ seletor: Selector) {
        Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: seletor, userInfo: nil, repeats: false)
    }
    
    func proximaQuestao() {
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            configurarTempoEntreQuestoes(#selector(configurarQuestao))
        } else {
            configurarTempoEntreQuestoes(#selector(finalizarQuiz))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desempenhoVC = segue.destination as? DesempenhoViewController {
            desempenhoVC.pontuacao = pontuacao
        }
    }
    
    func desbloquearRespostas() {
        for resposta in respostas {
            resposta.isEnabled = true
        }
    }
    
    @objc func bloquearRespostas() {
        for resposta in respostas {
            resposta.isEnabled = false
        }
    }
    
    @objc func finalizarQuiz() {
        performSegue(withIdentifier: "irParaDesempenhoDoQuiz", sender: nil)
    }
    
    @objc func configurarQuestao() {
        desbloquearRespostas()
        questao.text = questoes[numeroQuestao].titulo
        for resposta in respostas {
            let tituloRespostaBotao = questoes[numeroQuestao].respostas[resposta.tag]
            resposta.setTitle(tituloRespostaBotao, for: .normal)
            resposta.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
            resposta.addTarget(self, action: #selector(bloquearRespostas), for: .touchDown)
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
