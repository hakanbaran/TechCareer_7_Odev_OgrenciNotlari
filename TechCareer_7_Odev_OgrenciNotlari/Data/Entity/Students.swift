//
//  Students.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import Foundation


class Students {
    
    var student_id: Int?
    var student_name: String?
    var student_score: String?
    init() {
    }
    
    init(student_id: Int, student_name: String, student_score: String) {
        self.student_id = student_id
        self.student_name = student_name
        self.student_score = student_score
    }
}
