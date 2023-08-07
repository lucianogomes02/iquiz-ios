//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Luciano Gomes on 05/08/23.
//

import UIKit

class QuestaoViewController: UIViewController {

    @IBOutlet weak var tituloQuestao: UILabel!
    
    @IBOutlet var botoesRespostas: [UIButton]!
    
    @IBAction func respostaBotao(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configurarLayout()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        for botao in botoesRespostas {
            botao.layer.cornerRadius = 12.0
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
