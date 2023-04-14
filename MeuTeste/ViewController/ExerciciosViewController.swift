//
//  ExerciciosViewController.swift
//  MeuTeste
//
//  Created by Rodrigo Colozio on 03/04/23.
//

import UIKit

class ExerciciosViewController: UIViewController, didAddExerciseDelegate{
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var buttonAddExercise: UIButton!
    
    // MARK: - Atributos
    var exercicios: [Exercises] = []
    
   
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
        configuraLayout()
    }
    
    // MARK: - Methods
    func configuraLayout(){
        navigationItem.title = "Exercises"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addDestinationVC = segue.destination as? AddViewController else { return }
        addDestinationVC.delegate = self
       
    }
    
    // MARK: - Delegate Method
    func adicionarExercicio(_ exercicio: Exercises) {
        exercicios.append(exercicio)
        tv.reloadData()
    }
}
// MARK: - UITableViewDataSource

extension ExerciciosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let path = exercicios[indexPath.row]
        cell.textLabel?.text = path.nome
        
        // adding a Gesture to my table
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handlerLongPress))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    // func to add my gesture into #Selector
    @objc func handlerLongPress(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            let indexPath = gesture.location(in: tv)
            if let indexPath = tv.indexPathForRow(at: indexPath) {
                let exercicio = exercicios[indexPath.row]
                let alerta = UIAlertController(title:"Exercicio: \(exercicio.nome)", message: "Repetição: \(exercicio.rep)", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "Ok", style: .cancel))
                alerta.addAction(UIAlertAction(title: "Remover", style: .destructive, handler: {
                    alerta in 
                    self.exercicios.remove(at: indexPath.row)
                    self.tv.reloadData()
                }))

                self.present(alerta, animated: true)
            }
        }
    }
    
}
// MARK: - UITableViewDelegate

extension ExerciciosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
