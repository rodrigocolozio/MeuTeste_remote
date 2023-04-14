//
//  ViewController.swift
//  MeuTeste
//
//  Created by Rodrigo Colozio on 03/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var botaoInicio: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraBackgroundView()
    }
    
    @objc func configuraBackgroundView(){
        backgroundView.layer.cornerRadius = 50
        botaoInicio.layer.cornerRadius = 20
        botaoInicio.layer.borderWidth = 2
        botaoInicio.layer.borderColor = UIColor.white.cgColor
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        let botaoPressionado = sender.tag
        if botaoPressionado == 1{
            animacaoBotao(sender)
        }
    }
    
    func animacaoBotao (_ botao: UIButton){
        let animacao = CABasicAnimation(keyPath: "position")
        animacao.duration = 0.4
        animacao.repeatCount = 2
        animacao.autoreverses = true
        let posicaoInicial = CGPoint(x: botao.center.x, y: botao.center.y + 10)
        animacao.fromValue = posicaoInicial
        let posicaoFinal = CGPoint(x: botao.center.x, y: botao.center.y - 10)
        animacao.toValue = posicaoFinal
    }
    

}

