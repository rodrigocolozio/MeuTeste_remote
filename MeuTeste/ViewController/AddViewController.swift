//
//  AddViewController.swift
//  MeuTeste
//
//  Created by Rodrigo Colozio on 03/04/23.
//

import UIKit

protocol didAddExerciseDelegate {
    func adicionarExercicio(_ exercicio: Exercises)
}


class AddViewController: UIViewController {
    
    // MARK: - Atributos
    var exercicio: [Exercises] = []
    var delegate: didAddExerciseDelegate?

    
    
    // MARK: - IBOutlets

    @IBOutlet var addView: UIView!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var exerciseTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    
    func configuraLayout(){
        // customize textField
        exerciseTextField.layer.cornerRadius = 10
        repsTextField.layer.cornerRadius = 10
        exerciseTextField.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        repsTextField.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        // customize button
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.white.cgColor
        addButton.layer.cornerRadius = 25
    }
    
    func recuperaDadosDigitados() -> Exercises? {
        guard let exercicio = exerciseTextField.text else { return nil}
        guard let reps = repsTextField.text else { return nil }
        
        let workout = Exercises(nome: exercicio, rep: reps)
        
        return workout
    }
    
    
    // MARK: - IBAction
    @IBAction func add(_ sender: UIButton) {
        if let meuExercicio = recuperaDadosDigitados(){
            let textFields = [exerciseTextField, repsTextField]
            if Animacao().validadorAnimation(textFields){
                exercicio.append(meuExercicio)
                delegate?.adicionarExercicio(meuExercicio)
                navigationController?.popViewController(animated: true)
            }
        } else {
            Alerta(viewController: self).exibirAlerta(titulo: "Error", mensagem: "The app could not add your workout to your list, please reopen the app", estilo: .alert, botao: "Ok", estiloBotao: .cancel)
        }
    }
}
