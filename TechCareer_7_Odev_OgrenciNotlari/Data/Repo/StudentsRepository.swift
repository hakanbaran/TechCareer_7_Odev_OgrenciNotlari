//
//  StudentsRepository.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import Foundation
import RxSwift

class StudentsRepository {
    
    var studentsArray = BehaviorSubject<[Students]>(value: [Students]())
    
    
    func saveStudent(student_name: String, student_score: String) {
        print("Save : \(student_name) -- \(student_score)")
    }
    
    func updateStudent(student_id: Int,student_name: String, student_score: String) {
        print("Update : \(student_id) --\(student_name) -- \(student_score)")
    }
    
    func searchStudent(search_name: String) {
        
        print("Search : \(search_name)")
        
    }
    
    func deleteStudent(student_id: Int) {
        print("Delete : \(student_id)")
    }
    
    
    func loadStudents() {
        
        var array = [Students]()
        let s1 = Students(student_id: 1, student_name: "Hakan", student_score: "11")
        let s2 = Students(student_id: 2, student_name: "Aysu", student_score: "22")
        let s3 = Students(student_id: 3, student_name: "Kasım", student_score: "33")
        
        array.append(s1)
        array.append(s2)
        array.append(s3)
        studentsArray.onNext(array)
        
    }
    
    
    
    
    
}
