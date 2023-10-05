//
//  DetailsVC.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var scoreLabel: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    var student: Students?
    
    
    var viewModel = DetailsVCViewModel()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let s = student {
            
            nameLabel.text = s.student_name
            scoreLabel.text = s.student_score
        }
        
        
        
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        if let name = nameLabel.text, let score = scoreLabel.text, let s = student {
            viewModel.update(student_id: s.student_id!, student_name: name, student_score: score)
        }
        
        
        
    }
    
    

}
