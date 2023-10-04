//
//  RecordingVCViewModel.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import Foundation


class RecordingVCViewModel {
    
    var sRepo = StudentsRepository()
    
    func save(student_name: String, student_score: String) {
        sRepo.saveStudent(student_name: student_name, student_score: student_score)
    }
    
    
    
}
