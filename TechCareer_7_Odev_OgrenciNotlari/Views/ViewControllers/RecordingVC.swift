//
//  RecordingVC.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import UIKit

class RecordingVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var scoreLabel: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var viewModel = RecordingVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let name = nameLabel.text, let score = scoreLabel.text {
            
            if name == "" || score == "" {
                alertMessage()
            } else {
                viewModel.save(student_name: name, student_score: score)
            }
            
            
        }
    }
    
    
    func alertMessage() {
        let alert = UIAlertController(title: "Uppss!!!", message: "Please fill in the blank fields...", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}


