//
//  DetailsVCViewModel.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import Foundation

class DetailsVCViewModel {
    
    var sRepo = StudentsRepository()
    
    func update(student_id:Int, student_name:String, student_score:String) {
        sRepo.updateStudent(student_id: student_id, student_name: student_name, student_score: student_score)
    }
    
}
