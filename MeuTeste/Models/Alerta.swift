//
//  Alerta.swift
//  MeuTeste
//
//  Created by Rodrigo Colozio on 14/04/23.
//

import UIKit

class Alerta: NSObject {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func exibirAlerta(titulo: String, mensagem: String, estilo: UIAlertController.Style, botao: String, estiloBotao: UIAlertAction.Style){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: estilo)
        let botaoAlerta = UIAlertAction(title: botao, style: estiloBotao)
        alerta.addAction(botaoAlerta)
        alerta.present(alerta, animated: true)
        
    }

}
