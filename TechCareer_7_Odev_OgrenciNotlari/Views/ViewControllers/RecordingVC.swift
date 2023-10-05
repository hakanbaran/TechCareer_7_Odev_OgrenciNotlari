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

    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let name = nameLabel.text, let score = scoreLabel.text {
            viewModel.save(student_name: name, student_score: score)
        }
        
    }
    
}
